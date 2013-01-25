class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :word
      t.string :guesses
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
