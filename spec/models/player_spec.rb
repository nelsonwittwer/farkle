require 'spec_helper'

describe Player do
	before(:each) do
		@p=Player.new
		subject { @p }
	end
	it { should respond_to(:name) }
	it { should respond_to(:game_points) }
	it { should respond_to(:turns) }

	context "initialize" do
		it "should have an array of turns" do
			@p.turns.should be_an_instance_of(Array)
		end
		it "should start out with game points of 0" do
			@p.game_points.should eq(0)
		end
	end
	context "playing" do
		it "should allow a player to start a turn" do
			@p.start_turn
			@p.turns.count.should eq(1)
		end
		it "should keep track of their score during the game" do
			@p.start_turn
			@p.start_turn
			@p.turns.each do |turn|
				turn.total_points=100
			end
			@p.score.should_not eq(200)
		end
	end
end
