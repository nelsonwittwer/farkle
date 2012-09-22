class Turn < ActiveRecord::Base
  attr_accessible :total_points, :end_turn, :player_id
  attr_accessor :end_turn, :total_points
  has_many :rounds
  after_save :start_turn

  after_initialize do |turn|
  	# self.end_turn=false
  end

  def start_turn
  	self.rounds.create
  	self.score
  end

  def play_new_round
  	self.rounds.create
  	self.score
  end

  def score
  	@total_points=0
  	self.rounds.each do |round|
  		if round.points == 0
  			@total_points=0
  			self.end_turn=true
  		elsif self.end_turn==false
		    @total_points+=round.points
  		end
  	end
  end



end
