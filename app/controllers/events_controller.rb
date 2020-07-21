class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find session[:current_user_id]
    @event = @user.created_events.build(event_params)
    @event.creator_id = session[:current_user_id]

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :description)
  end
end
