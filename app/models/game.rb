class Game < ActiveRecord::Base
  has_many :performances
  belongs_to :week
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_id"
  belongs_to :away_team, :class_name => "Team", :foreign_key => "away_id"

  def away_performance
    self.performances.find_by_team_id(self.away_team.id)
  end

  def home_performance
    self.performances.find_by_team_id(self.home_team.id)
  end

  def away_spread
    performance = self.away_performance
    performance.spread/10.0
  end

  def home_spread
    performance = self.home_performance
    performance.spread/10.0
  end

  def home_beat_spread
    home_diff = self.home_performance.total - self.away_performance.total
    if (home_diff + self.home_performance.spread) > 0
      'win'
      # (home_diff + self.home_performance.spread)
    elsif (home_diff + self.home_performance.spread) < 0
      'lose'
      # (home_diff + self.home_performance.spread)
    elsif (home_diff + self.home_performance.spread) == 0
      'push'
      # (home_diff + self.home_performance.spread)
    end
    # (home_diff + self.home_performance.spread)
  end

  def home_spread_result_class
    if (self.home_performance.total || self.away_performance.total)
      home_diff = self.home_performance.total - self.away_performance.total
      if (home_diff + self.home_performance.spread) > 0
        'success'
      elsif (home_diff + self.home_performance.spread) < 0
        'danger'
      elsif (home_diff + self.home_performance.spread) == 0
        'warning'
      end
    end
  end
  def away_spread_result_class
    if (self.home_performance.total || self.away_performance.total)

      home_diff = self.home_performance.total - self.away_performance.total
      if (home_diff + self.home_performance.spread) > 0
        'danger'
      elsif (home_diff + self.home_performance.spread) < 0
        'success'
      elsif (home_diff + self.home_performance.spread) == 0
        'warning'
      end
    end
  end
end
