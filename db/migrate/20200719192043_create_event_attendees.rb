class CreateEventAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendees do |t|
      t.integer :event_attending_id
      t.integer :event_attendee_id
      t.timestamps
    end
  end
end
