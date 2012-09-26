require 'spec_helper'

describe Round do
	before(:each) do
		@r=Round.new
		subject { @r }
	end
		
	
	it { should respond_to(:name) }
	it { should respond_to(:points) }
	it { should respond_to(:stay) }

	context "creation" do
		it "should create 6 dice for the round" do
			@r.dices.count.should == 6
		end
	end

	context "scoring" do
		it "should search for straight (1..6)" do
			for i in 1..6
				@r.dices[i-1].value=i
			end
			@r.score
			@r.points.should == 1500
		end

		it "should search for 6 of a kind" do
			for i in 0..5 
				@r.dices[i].value=1
			end
			@r.score
			@r.points.should == 3000
		end

		it "should search for 5 of a kind" do
			for i in 0..4 
				@r.dices[i].value=1
			end
			@r.dices[5].value=2
			@r.score
			@r.points.should == 1500
		end

		it "should search for a 4 of a kind" do
			for i in 0..3 
				@r.dices[i].value=1
			end
			@r.dices[5].value=2
			@r.dices[4].value=3
			@r.score
			@r.points.should == 1000
		end

		it "should search for a 4 of a kind and a pair" do
			for i in 0..3 
				@r.dices[i].value=1
			end
			@r.dices[5].value=3
			@r.dices[4].value=3
			@r.score
			@r.points.should == 1300
		end

		it "should search two tripples" do
			for i in 0..2 
				@r.dices[i].value=1
			end
			for i in 3..5
				@r.dices[i].value=2
			end
			@r.score
			@r.points.should == 2000
		end
		it "should search three doubles" do
			@r.dices[0].value=1
			@r.dices[1].value=1
			@r.dices[2].value=3
			@r.dices[3].value=3
			@r.dices[4].value=2
			@r.dices[5].value=2
			@r.score
			@r.points.should == 1500
		end
		it "should give you 100 * value of dice for tripples" do
			@r.dices[0].value=2
			@r.dices[1].value=2
			@r.dices[2].value=2
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 200
			@r.dices[0].value=3
			@r.dices[1].value=3
			@r.dices[2].value=3
			@r.dices[3].value=6
			@r.dices[4].value=2
			@r.dices[5].value=2
			@r.score
			@r.points.should == 300
			@r.dices[0].value=4
			@r.dices[1].value=4
			@r.dices[2].value=4
			@r.dices[3].value=3
			@r.dices[4].value=2
			@r.dices[5].value=2
			@r.score
			@r.points.should == 400
			@r.dices[0].value=5
			@r.dices[1].value=5
			@r.dices[2].value=5
			@r.dices[3].value=3
			@r.dices[4].value=2
			@r.dices[5].value=2
			@r.score
			@r.points.should == 500
			@r.dices[0].value=6
			@r.dices[1].value=6
			@r.dices[2].value=6
			@r.dices[3].value=3
			@r.dices[4].value=2
			@r.dices[5].value=2
			@r.score
			@r.points.should == 600
		end
		it "should give you 100 points per 1" do
			@r.points=0
			@r.dices[0].value=1
			@r.dices[1].value=1
			@r.dices[2].value=1
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 300
			@r.points=0
			@r.dices[0].value=1
			@r.dices[1].value=1
			@r.dices[2].value=4
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 200
			@r.points=0
			@r.dices[0].value=1
			@r.dices[1].value=4
			@r.dices[2].value=2
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 100
		end
		it "should give you 50 points per 5" do
			@r.points=0
			@r.dices[0].value=5
			@r.dices[1].value=5
			@r.dices[2].value=4
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 100
			@r.points=0
			@r.dices[0].value=5
			@r.dices[1].value=4
			@r.dices[2].value=4
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			@r.points.should == 50
			@r.points=0
			@r.dices[0].value=2
			@r.dices[1].value=4
			@r.dices[2].value=2
			@r.dices[3].value=3
			@r.dices[4].value=3
			@r.dices[5].value=5
			@r.score
			@r.points.should == 50
		end
		context "grab bag" do
			it "should score correctly with three 1s and two 5s" do
				@r.points=0
				@r.dices[0].value=1
				@r.dices[1].value=1
				@r.dices[2].value=1
				@r.dices[3].value=3
				@r.dices[4].value=5
				@r.dices[5].value=5
				@r.score
				@r.points.should == 400
			end
			it "should score correctly with two 5s and two 1s" do
				@r.points=0
				@r.dices[0].value=1
				@r.dices[1].value=1
				@r.dices[2].value=4
				@r.dices[3].value=3
				@r.dices[4].value=5
				@r.dices[5].value=5
				@r.score
				@r.points.should == 300
			end
			it "should score correctly with fours 1s and one 5" do
				@r.points=0
				@r.dices[0].value=1
				@r.dices[1].value=1
				@r.dices[2].value=1
				@r.dices[3].value=1
				@r.dices[4].value=4
				@r.dices[5].value=5
				@r.score
				@r.points.should == 1050
			end

		end
	end

	context "rolling again" do
		it "should accept an array of 6 booleans, if false it should re-roll the dice" do
			@r.held_dice=[false,false,false,false,false,false]
			@r.dices[0].value=2
			dice=@r.dices[0] #make sure the dice isn't the same when it is re-rolled
			@r.dices[1].value=1
			@r.dices[2].value=1
			@r.dices[3].value=1
			@r.dices[4].value=1
			@r.dices[5].value=1
			new_held_dice = [false,true,true,true,true,true]
			@r.roll_again(new_held_dice)
			@r.dices[0].should_not eq(dice)
			@r.held_dice.should eq(new_held_dice)
		end

		it "should require you to hold at least one more dice than last roll" do
			@r.held_dice=[true,false,false,false,false,false]
			new_held_dice=[true,false,false,false,false,false]
			lambda {@r.roll_again(new_held_dice)}.should raise_error

		end

		it "should update Round.held_dice after each dice roll" do
			@r.held_dice=[false,false,false,false,false,false]
			new_held_dice=[true,false,false,false,false,false]
			@r.roll_again(new_held_dice)
			@r.held_dice.should_not == [false,false,false,false,false,false]
			@r.held_dice.should eq([true, false,false,false,false,false])
		end

		it "should score the results again after the roll" do
			@r.points=0
			@r.dices[0].value=5
			@r.dices[1].value=5
			@r.dices[2].value=4
			@r.dices[3].value=3
			@r.dices[4].value=6
			@r.dices[5].value=6
			@r.score
			a=@r.points
			new_held_dice=[true,true,false,false,false,false]
			@r.roll_again(new_held_dice)
			b=@r.points
			a.should_not eq(b)
		end
	end
	# context "ending process" do
	# 	it "should allow player to stay" do
	# 		@r.points=0
	# 		@r.dices[0].value=5
	# 		@r.dices[1].value=5
	# 		@r.dices[2].value=5
	# 		@r.dices[3].value=3
	# 		@r.dices[4].value=6
	# 		@r.dices[5].value=6
	# 		@r.score
	# 		@r.player_stays
	# 		@r.stay.should eq(true)
	# 	end
	# end
end
