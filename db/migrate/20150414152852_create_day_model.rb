class CreateDayModel < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.string :name
      t.boolean :public, default: false
      t.belongs_to :convention, index: true
    end
  end
end
