class CreateConventionModel < ActiveRecord::Migration
  def change
    create_table :conventions do |t|
      t.string :title
      t.string :convention_email
      t.integer :timeslot_duration
    end
  end
end
