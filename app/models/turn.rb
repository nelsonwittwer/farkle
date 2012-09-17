class Turn < ActiveRecord::Base
  attr_accessible :total_points, :end_turn, :player_id
  attr_accessor :end_turn
  has_many :rounds

  after_initialize do |turn|
  	start_turn
  	self.end_turn=false
  end

  def start_turn
  	self.rounds.new.save
  	self.rounds.first.score
  	self.score
  end

  def play_new_round
  	self.rounds.new.save
  	self.rounds.last.score
  	self.score
  end

  def score
  	self.total_points=0
  	self.rounds.each do |round|
  		if round.points == 0
  			self.total_points=0
  			self.end_turn=true
  		elsif self.end_turn==false
		    self.total_points=self.total_points+round.points
  		end
  	end
  end



end
