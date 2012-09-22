class AddGameScoreToGamesPlayers < ActiveRecord::Migration
  def change
    add_column :games_players, :game_score, :integer
  end
end
