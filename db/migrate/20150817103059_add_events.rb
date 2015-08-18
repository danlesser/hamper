class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :timetable_name
      t.string :conbook_name
      t.string :conbook_description
      t.time :start_time
      t.integer :setup_duration, default: 15
      t.integer :seating_duration, default: 0
      t.integer :event_duration, default: 30
      t.integer :teardown_duration, default: 15
      t.boolean :public, default: false
      t.string :room_layout
      t.string :convention_equipment
      t.string :hotel_equipment
      t.string :notes
      t.belongs_to :convention, index: true
      t.belongs_to :day, index: true
      t.belongs_to :room, index: true
      t.belongs_to :track, index: true
    end
  end
end
