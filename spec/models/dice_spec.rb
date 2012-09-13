require 'spec_helper'

describe Dice do

	context "creation" do
		
	    it "should be created with a value between 1 and 6" do
	    	d = Dice.new
	    	d.save
	    	d.value.should be > 0
	    	d.value.should be < 7
	    end    
    end

end
