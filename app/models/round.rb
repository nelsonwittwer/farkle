class Round
  attr_accessor :held_dice, :old_points, :name, :stay, :complete, :dices, :points
  def initialize
    @held_dice=[false,false,false,false,false,false]
    @complete=false
    @points=0
    @dices=[]

  	6.times do
  		@dices << Dice.new
  	end
    score
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
  	@result = get_result(@dices)
  	if sort_dice(@result) == [1,2,3,4,5,6]
  		@points=1500
  		@name="Straight!"
  		@complete=true
  	elsif count_same_dice(@result).max==6
  		@points=3000
  		@name="6 of a kind!"
  		@complete=true
  	elsif count_same_dice(@result).max==5
  		@points=1500
  		@name="5 of a kind!"
  	elsif count_same_dice(@result).max==4 && count_same_dice(@result).count(2)!=1
  		@points=1000
  		@name="4 of a kind!"
  	elsif count_same_dice(@result).count(3)==2
  		@points=2000
  		@name="Two Tripples!"
  		@complete=true
  	elsif count_same_dice(@result).count(2)==3
  		@points=1500
  		@name="Three Doubles!"
  		@complete=true
  	elsif count_same_dice(@result).count(3)==1
  		tripple_value=[]
  		for i in 0..5
  			if count_same_dice(@result)[i]==3
  				@points=100*(i+1)
  				@name="Three #{i+1}s!"
  				#1s are 300, not 100
  				if i==0
  					@points=300
  				end
  			end
      end
  	elsif count_same_dice(@result).max==4 && count_same_dice(@result).count(2)==1
  		@name="4 of a kind and a pair!"
  		@points=1300
    end
  	#100 for each 1	
  	if count_same_dice(@result)[0]>0 && count_same_dice(@result)[0]<3 && @complete!=true
      @points=@points+(100*count_same_dice(@result)[0])
  		@name="#{count_same_dice(@result)[0]} 1s!"
  	end
  	#50 for each 5
  	if count_same_dice(@result)[4]>0 && count_same_dice(@result)[4]<3 && @complete!=true
    		@points=@points+(50*count_same_dice(@result)[4])
    		@name="#{count_same_dice(@result)[4]} 5s!"
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
    if new_held_dice.count(true) > @held_dice.count(true)
      for i in 0..held_dice.count-1
        if new_held_dice[i]==false
          dices[i]=Dice.new
        end
      end
      @held_dice=new_held_dice
      @old_points=@points
      score
      if @old_points < @points
        @points=0
        @complete=true
      end
    else
      raise TypeError, 'You must hold at least one more dice to roll'
    end
  end
end
