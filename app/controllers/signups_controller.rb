class SignupsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    newSignup = Signup.create!(signup_params)
    render json: newSignup.activity, status: :created
  end

  private

  def signup_params
    params.permit(:time, :camper_id, :activity_id, :signup)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

end
