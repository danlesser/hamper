class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :public_name
      t.belongs_to :convention, index: true
    end
  end
end
