class Round < ActiveRecord::Base
  attr_accessible :name, :points, :stay, :complete
  attr_accessor :held_dice, :old_points
  has_many :dices
  belongs_to :turn
  after_save :setup
  def setup
  	self.held_dice=[false,false,false,false,false,false]
  	self.complete=false
    self.points=0
  	6.times do
  		self.dices.new.save
  	end
    self.score
  end

  #######################
  ### Scoring methods ###
  #######################

  #look into putting options into a hash, check if true
  #lambda research
  # conditions = []
  # conditions<<{condition: lambda{|result|sort_dice(result) == [1,2,3,4,5,6]}, name: "Straight!", points: 1500, complete: true}
  # conditions<<{condition: lambda{|result|sort_dice(result) == [1,2,3,4,5,6]}, name: "Straight!", points: 1500, complete: true}
  # conditions<<{condition: lambda{|result|sort_dice(result) == [1,2,3,4,5,6]}, name: "Straight!", points: 1500, complete: true}

  # conditions.select{|hash|hash[:condition].call(@result)}

  def score
  	@result = get_result(self.dices)
  	if sort_dice(@result) == [1,2,3,4,5,6]
  		self.points=1500
  		self.name="Straight!"
  		self.complete=true
  	elsif self.count_same_dice(@result).max==6
  		self.points=3000
  		self.name="6 of a kind!"
  		self.complete=true
  	elsif self.count_same_dice(@result).max==5
  		self.points=1500
  		self.name="5 of a kind!"
  	elsif self.count_same_dice(@result).max==4 && count_same_dice(@result).count(2)!=1
  		self.points=1000
  		self.name="4 of a kind!"
  	elsif self.count_same_dice(@result).count(3)==2
  		self.points=2000
  		self.name="Two Tripples!"
  		self.complete=true
  	elsif self.count_same_dice(@result).count(2)==3
  		self.points=1500
  		self.name="Three Doubles!"
  		self.complete=true
  	elsif self.count_same_dice(@result).count(3)==1
  		tripple_value=[]
  		for i in 0..5
  			if self.count_same_dice(@result)[i]==3
  				self.points=100*(i+1)
  				self.name="Three #{i+1}s!"
  				#1s are 300, not 100
  				if i==0
  					self.points=300
  				end
  			end
      end
  	elsif self.count_same_dice(@result).max==4 && count_same_dice(@result).count(2)==1
  		self.name="4 of a kind and a pair!"
  		self.points=1300
    end
  	#100 for each 1	
  	if self.count_same_dice(@result)[0]>0 && self.count_same_dice(@result)[0]<3 && self.complete!=true
      self.points=self.points+(100*self.count_same_dice(@result)[0])
  		self.name="#{self.count_same_dice(@result)[0]} 1s!"
  	end
  	#50 for each 5
  	if self.count_same_dice(@result)[4]>0 && self.count_same_dice(@result)[4]<3 && self.complete!=true
    		self.points=self.points+(50*self.count_same_dice(@result)[4])
    		self.name="#{self.count_same_dice(@result)[4]} 5s!"
    end

    if self.points.nil?
      binding.pry
    end

  end


  	
  def sort_dice(array_o_dice)
  	 array_o_dice.sort! { |a,b| a <=> b }
  end

  def get_result(array_o_dice)
  	result=[]
  	i=0
  	array_o_dice.count.times do
  		result[i]=array_o_dice[i].value
  		i=i+1
	  end
	  return result
  end

  def count_same_dice(array)
  	count =[]
  	for i in 1..6
  		count[i-1]=array.count(i)
  	end
  	return count
  end

  ##########################
  ### Roll Again Methods ###
  ##########################

  def roll_again(new_held_dice)
    if new_held_dice.count(true) > self.held_dice.count(true)
      for i in 0..held_dice.count-1
        if new_held_dice[i]==false
          self.dices[i]=Dice.new
        end
      end
      self.held_dice=new_held_dice
      self.old_points=self.points
      self.score
      if self.old_points < self.points
        self.points=0
        self.complete=true
      end
    else
      #I need to raise exception if the player didn't hold another dice.
    end
  end

  ##########################
  ### Player Stay Method ###
  ##########################

  def player_stays
    self.stay=true
  end
	
end
