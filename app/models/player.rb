class Player
  attr_accessor :name, :game_points, :turns

  def initialize 
  	@turns=[]
  	@game_points=0
  end	

  def start_turn
  	@turns << Turn.new
  end

  def score
  	@turns.each do |turn|
  		@game_points+=turn.total_points
  	end
  end
end
