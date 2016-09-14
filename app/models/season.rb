class Season < ActiveRecord::Base
  has_many :weeks
  has_many :games, :through => :weeks
  has_many :performances, :through => :games
  has_many :picks, :through => :performances

end
