class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :gamename

      t.timestamps
    end
  end
end
