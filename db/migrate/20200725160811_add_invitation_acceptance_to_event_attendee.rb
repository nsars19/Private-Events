class AddInvitationAcceptanceToEventAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendees, :attending, :boolean, default: false
  end
end
