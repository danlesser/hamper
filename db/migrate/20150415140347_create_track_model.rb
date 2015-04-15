class CreateTrackModel < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :rank
      t.belongs_to :convention, index: true
    end
  end
end
