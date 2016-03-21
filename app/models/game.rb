class Game < ActiveRecord::Base
  has_many :lines
  belongs_to :week
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_id"
  belongs_to :away_team, :class_name => "Team", :foreign_key => "away_id"

  def away_line
    self.lines.find_by_team_id(self.away_team.id)
  end

  def home_line
    self.lines.find_by_team_id(self.home_team.id)
  end

  def away_spread
    line = self.away_line
    line.spread/10.0
  end

  def home_spread
    line = self.home_line
    line.spread/10.0
  end
end
