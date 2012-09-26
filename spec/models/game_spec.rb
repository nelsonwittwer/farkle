require 'spec_helper'

describe Game do
	before(:each) do
		@g=Game.create
		subject { @g }
	end	
	it { should respond_to(:player_count) }
	it { should respond_to(:winner) }
	it { should respond_to(:players) }
	context "start process" do
		it "should ask you for how many players you would like to play with" do
			@g.setup_game(2)
			@g.players.size.should eq(2)
		end
	end

	context "game mechanincs" do

		it "should end the game when a player gets  >= 10000 points" do
			# @g.setup_game(2)
			# @g.players[1].game_points=10000
			# @g.winner.should eq(@g.players[1])
		end
	end
end
