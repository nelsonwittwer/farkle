class AddPlayerIdToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :player_id, :integer
    add_index :turns, :player_id
  end
end
