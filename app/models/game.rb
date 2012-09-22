class Game < ActiveRecord::Base
	has_and_belongs_to_many :players
	attr_accessible :player_count
	attr_accessor :player_count, :player_turn, :winner
	has_many :turns
	validates_numericality_of :player_count, :only_integer => true 

	def start_game
		self.player_count=self.player_count.to_i
		self.player_count.times do
			self.players.new.save
		end
		#start turn for first player
		self.start_turn(self.players.first)
	end

	def start_turn(player)
		turn=self.turns.new(player_id: player.id).save
		round=turn.rounds.last
	end
end
