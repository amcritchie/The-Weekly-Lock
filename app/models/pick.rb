class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance

  def game
    self.performance.game
  end

  def previous_pick
    Pick.where('id < ? AND public_lock = true', id).last
  end

  def previous_three
    picks = []
    @current_pick = self
    3.times {
      @current_pick = @current_pick.previous_pick if @current_pick
      picks.push(@current_pick)
    }
    picks.reverse
  end

  def self.record
    record = {wins: 0, losses: 0, pushes: 0}
    all.each do |pick|
      result = pick.performance.spread_result
      if result == 'win'
        record[:wins] += 1
      elsif result == 'loss'
        record[:losses] += 1
      elsif result == 'push'
        record[:pushes] += 1
      end
    end
    record
  end
end
