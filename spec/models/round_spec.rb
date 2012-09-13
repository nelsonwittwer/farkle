require 'spec_helper'

describe Round do
	context "creation" do
		it "should have 6 dice" do
			r = Round.new
			r.dices.count.should == 6
		end
	end
end
