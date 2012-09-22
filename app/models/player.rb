class Player < ActiveRecord::Base
  attr_accessible :name, :game_score
  attr_accessor :game_score
  has_and_belongs_to_many :games
end
