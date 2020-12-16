class Api::V1::EventsController < ApplicationController
  # The authenticity token is used to prevent CSRF attacks.
  # Seeing as this is a general API endpoint, we don't need this protection. 
  skip_before_action :verify_authenticity_token

  # POST /api/v1/events
  def create
    contact = Contact.find_or_create_by(email: events_params[:email])

    if contact.errors.present?
      return render json: { error: contact.errors.map(&:message) }, status: 422
    end

    event = contact.events.find_or_create_by(sg_event_id: events_params[:sg_event_id])

    begin
      event.update(events_params.except(:email))
    rescue ArgumentError => error
      # event_type enum can only throw ArgumentError instead of going through the validator
      return render json: { error: error.message }, status: 422
    rescue ActiveRecord::RecordNotUnique
      return render json: { error: 'An event with this sg_event_id already exists under a different email' }, status: 422
    end

    if event.errors.present?
      return render json: { error: event.errors.map(&:message) }, status: 422
    end

    render json: {}, status: 200
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

    # Rename :event param to :event_type
    # Event types 'bounce' and 'blocked' come in as two separate parameters.
    # When it's bounce, :event is 'bounce' and :type is 'bounce'.
    # When it's blocked, :event is 'bounce' and :event is 'blocked'.
    sanitised_params[:event_type] = (sanitised_params[:event] == 'bounce') ? sanitised_params[:type] : sanitised_params[:event]

    sanitised_params.delete(:event)
    sanitised_params.delete(:type)

    return sanitised_params
  end
end
