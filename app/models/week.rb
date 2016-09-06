class Week < ActiveRecord::Base
  belongs_to :season
  has_many :games
  has_many :performances, :through => :games
  has_many :picks, :through => :performances


  def public_pick
    self.picks.find_by_public_lock(true)
  end

  def last_week
    self.season.weeks.find_by_position((self.position - 1))
  end

  def self.latest_week
    week = Week.last
    until week.games.length > 0
      week = week.last_week
    end
    week
  end

  def last_preformance_of_team(team_id)
    week = self.last_week
    until week.performances.find_by_team_id(team_id)
      week = week.last_week
    end
    week.performances.find_by_team_id(team_id)
  end
end
