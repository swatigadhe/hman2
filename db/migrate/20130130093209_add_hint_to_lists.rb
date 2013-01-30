class AddHintToLists < ActiveRecord::Migration
  def change
    add_column :lists, :hint, :string
  end
end
