class AddGameIdToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :game_id, :integer
    add_index :turns, :game_id
  end
end
