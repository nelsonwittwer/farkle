require 'spec_helper'

describe Turn do
	before(:each) do
		@t=Turn.new
		@t.save
		subject { @t }
		@r=@t.rounds.first
	end

	it { should respond_to(:total_points) }
	it { should respond_to(:rounds) }
	it { should respond_to(:player_id) }

	context "starting" do
		it "should create a new round to start out with" do
			@t.rounds.count.should eq(1)
		end
		it "should have the total_points of the score of the first roll" do
			for i in 1..6
				@r.dices[i-1].value=1
			end
			@r.score
			@r.save
			@t.score
			@t.total_points.should eq(3000)
		end
		it "should add score up of previous round and new round" do
			for i in 1..6
				@r.dices[i-1].value=1
			end
			@r.score
			@r.save
		    @t.total_points=@t.rounds.first.points
			@t.play_new_round
			@r=@t.rounds.last
			for i in 1..6
				@r.dices[i-1].value=1
			end
			@r.score
			@r.save
			@t.score
			@t.total_points.should eq(6000)
		end
		it "should make total score zero if new round is zero" do
			for i in 1..6
				@r.dices[i-1].value=1
			end
			@r.score
			@r.save
		    @t.total_points=@t.rounds.first.points
			@t.play_new_round
			@r2=@t.rounds.last
			@r2.points=0
			@r2.dices[0].value=6
			@r2.dices[1].value=4
			@r2.dices[2].value=2
			@r2.dices[3].value=3
			@r2.dices[4].value=3
			@r2.dices[5].value=4
			@r2.score
			@r2.save
			@t.score
			@t.total_points.should eq(0)
		end
	end
end
