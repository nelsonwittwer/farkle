require 'spec_helper'

describe Game do
	before(:each) do
		@g=Game.new
		@g.save
		subject { @g }
	end	
	it { should respond_to(:turns) }
	it { should respond_to(:players) }
	context "start process" do
		it "should ask you for how many players you would like to play with" do
			@g.start_game(2)
			@g.players.size.should eq(2)
		end
		it "should start a new turn for the first player after the game has started" do
			@g.start_game(1)
			@g.turns.size.should eq(1)
		end
		it "should return the player's first round and it's result" do
			@g.start_game(1)
			r = @g.turns.first.rounds.first
			r.points=0
			r.dices[0].value=2
			r.dices[1].value=4
			r.dices[2].value=2
			r.dices[3].value=3
			r.dices[4].value=3
			r.dices[5].value=5
			r.score
			@g.turns.first.rounds.first.points.should eq(50)
		end
		it "should end the game when a player gets  >= 10000 points" do
				
		end
	end
end
