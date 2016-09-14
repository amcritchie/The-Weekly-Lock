class PerformancesController < ApplicationController

  def pick
    # Performance.find(params[:performance_id])
    @pick = Pick.new(user_id: current_user.id, performance_id: params[:performance_id], public_lock: true)

    # @sub_comment = SubComment.new params['subcomment']
    if @pick.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  # end
  end
end
