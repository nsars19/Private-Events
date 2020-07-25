class EventAttendeesController < ApplicationController
  helper_method :current_user

  def new
    cookies[:event_id] = params[:event_id]
    @invite = EventAttendee.new
  end

  def create
    @event = Event.find(cookies[:event_id])
    @user = User.where(username: params[:event_attendee][:invited_user]).first
    @invite = EventAttendee.create(
      attended_event_id: @event.id,
      event_attendee_id: @user.id
    )

    if @invite.save
      redirect_to event_path(@event)
    else
      render :new
    end  
  end

  def index
    invites = EventAttendee.where(event_attendee_id: current_user.id, attending: false)
    @events = invites.map { |invite| Event.find(invite.attended_event_id) }
  end

  def accept_invitation
    event_invited_to = EventAttendee.where(event_attendee_id: current_user.id, attended_event_id: params[:event_id])[0]
    event_invited_to.attending = true
    event_invited_to.save
    
    redirect_to event_attendees_path
  end
end
