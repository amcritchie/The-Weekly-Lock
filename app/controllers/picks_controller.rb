class PicksController < ApplicationController
  def public
    @pick = Pick.last
    if params[:sport]
      sport = Sport.find_by_slug(params[:sport])
      if sport && params[:year]
        season = sport.seasons.find_by_year(params[:year])
        if season && params[:week]
          week = season.weeks.find_by_position(params[:week])
          if week && week.public_pick
            @pick = week.public_pick
          end
        end
      end
    end

    @game = @pick.game
    @last_three = @pick.previous_three
  end
end
