class AddChancessRemainToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :chancess_remain, :integer
  end
end
