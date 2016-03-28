class Season < ActiveRecord::Base
  has_many :weeks
  has_many :games, :through => :weeks

end
