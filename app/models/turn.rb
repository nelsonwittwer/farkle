class Turn 
  attr_accessor :end_turn, :total_points, :rounds
  def initialize
  	@end_turn = false
  	@total_points=0
  	@rounds = []
  	play_new_round
  end



  def play_new_round
  	@rounds<<Round.new
  	score
  	if @total_points !=0
  		@rounds.last
  	else
  		@total_points
  	end
  end

  def score
  	@total_points=0
  	@rounds.each do |round|
  		if round.points == 0
  			@total_points=0
  			@end_turn=true
  		elsif @end_turn==false
		    @total_points+=round.points
  		end
  	end
  end



end
