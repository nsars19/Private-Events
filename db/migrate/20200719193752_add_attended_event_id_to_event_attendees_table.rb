class AddAttendedEventIdToEventAttendeesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :event_attendees, :event_attending_id
    add_column :event_attendees, :attended_event_id, :integer
  end
end
