class AddGuessWordToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :Guess_word, :string
  end
end
