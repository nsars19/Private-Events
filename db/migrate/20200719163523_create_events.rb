class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_location
      t.date :event_date
      t.time :event_time
      t.belongs_to :creator
      t.timestamps
    end
  end
end
