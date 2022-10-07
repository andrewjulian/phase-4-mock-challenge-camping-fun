class ActivitiesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    activities = Activity.all
    render json: activities, include: [:signups, :campers]
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end

  private

  def activity_params
    params.permit(:name, :difficulty)
  end

  def render_not_found_response
    render json: { error: "Activity not found"}, status: :not_found
  end

end
