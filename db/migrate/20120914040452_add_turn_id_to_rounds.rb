class AddTurnIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :turn_id, :integer
    add_index :rounds, :turn_id
  end
end
