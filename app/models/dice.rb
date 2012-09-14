class Dice < ActiveRecord::Base
  attr_accessible :value
  belongs_to :round, :dependent => :destroy

  after_initialize do |dice|
  	self.value=rand(1..6)
  end	
  

end
