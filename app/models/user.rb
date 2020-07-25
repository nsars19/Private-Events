class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendees
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"

  def attending? event_id
    self.event_attendees.find(event_id).attending
  end

  def not_attending? event_id
    !self.event_attendees.find(event_id).attending
  end

  def upcoming_events
    self.attended_events.where("event_date > :time_now",
      {time_now: Time.now})
  end

  def previous_events
    self.attended_events.where("event_date < :time_now",
      {time_now: Time.now})
  end
end
