class PerformancesController < ApplicationController

  def pick
    performance = Performance.find_by_id(params[:performance_id])

    if performance.nil?
      render :json => {code: 'not-valid-performance-id' }
    end

    if current_user.nil?
      render :json => {code: 'no-current-user' }
    end

    # Destroy previouse pick this week.
    performance.game.week.picks.where(user_id: current_user.id).destroy_all

    # Create new pick of performance.
    @pick = Pick.new(user_id: current_user.id, performance_id: params[:performance_id], public_lock: true)

    # Save pick
    if @pick.save
      render :json => {code: 'pick-created' } # send back any data if necessary
    else
      render :json => {code: 'pick-failed-save' }, :status => 500
    end
  end
end
