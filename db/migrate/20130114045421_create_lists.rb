class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :words
      t.references :game

      t.timestamps
    end
    add_index :lists, :game_id
  end
end
