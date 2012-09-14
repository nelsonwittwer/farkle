class AddDicesToRounds < ActiveRecord::Migration
  def change
    add_column :dices, :round_id, :integer
    add_index :dices, :round_id
  end
end
