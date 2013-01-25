class AddGuessStringToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :guess_string, :string
  end
end
