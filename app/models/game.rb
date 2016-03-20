class Game < ActiveRecord::Base
  belongs_to :week
  has_one :home_team, :class_name => "Team", :foreign_key => "home_id"
  has_one :away_team, :class_name => "Team", :foreign_key => "away_id"
end
