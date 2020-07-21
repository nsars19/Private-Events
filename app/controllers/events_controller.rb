class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.build(event_params)
    @event.creator_id = session[:current_user_id]

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :description)
  end
end
