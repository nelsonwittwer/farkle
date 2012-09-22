require 'spec_helper'

describe Player do
	it { should respond_to(:games) }
	it { should respond_to(:name) }
	context "scoring" do
		it "should keep track of their score during the game" do
			@g.game.new
			@g.save
			
		end
	end
end
