class Api::V1::EventsController < ApplicationController
  # The authenticity token is used to prevent CSRF attacks.
  # Seeing as this is a general API endpoint, we don't need this protection. 
  skip_before_action :verify_authenticity_token

  # POST /api/v1/events
  def create
    # TODO: if no contact, create one
    # TODO: add event to contact
    # TODO: return event as confirmation
    render json: events_params, status: 200
  end

  # PATCH /api/v1/events
  # PUT /api/v1/events
  def update
    # TODO
    render json: events_params, status: 200
  end

  private

  def events_params
    sanitised_params = params.permit(
      :email,
      :timestamp,
      :sg_event_id,
      :event,
      :type
    )
  end
end
