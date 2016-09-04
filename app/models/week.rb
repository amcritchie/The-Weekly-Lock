class Week < ActiveRecord::Base
  belongs_to :season
  has_many :games
  has_many :performances, :through => :games
  has_many :picks, :through => :performances


  def public_pick
    self.picks.find_by_public_lock(true)
  end

  def self.latest_week
    week = Week.last
    until week.games.length > 0
      week = week.last_week
    end
    week
  end
end
