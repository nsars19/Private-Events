class Event < ApplicationRecord
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :event_attendee
  belongs_to :creator, class_name: "User"

  def self.past
    @past = Event.where("event_date < :time_now",
      {time_now: Time.now})
  end

  def self.upcoming
    @upcoming = Event.where("event_date > :time_now",
      {time_now: Time.now})
  end
end
