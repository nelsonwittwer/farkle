class Game < ActiveRecord::Base
	attr_accessible :player_count
	attr_accessor :winner, :players, :player_count
	validates_numericality_of :player_count, :only_integer => true 

	def setup_game(player_count_input)
		player_count=player_count_input
		@players=[]
		player_count.times do
			@players << Player.new
		end
	end

	def play_game
		#until there is a winner, cycle through each player and give them a turn
		while @winner==nil
			@players.each do |player|
				while player.turns.last.end_turn==false do
					round=player.start_turn

				end
			end
		end
	end

end
