class Game < ActiveRecord::Base
	has_and_belongs_to_many :players
	has_many :turns

	def start_game(player_count)
		player_count.times do
			self.players.new.save
		end
		self.players.each do |player|
			self.play_turn(player)
		end
	end

	def play_turn(player)
		self.turns.new(player_id: player.id)
	end
end
