class Pick < ActiveRecord::Base
  belongs_to :line

  def game
    self.line.game
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
end
