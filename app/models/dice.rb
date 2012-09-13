class Dice < ActiveRecord::Base
  attr_accessible :value
  before_create :start
  
  private

  def start
  	self.value = rand(1..6)
  end
end
