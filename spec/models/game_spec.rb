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
	end
end
