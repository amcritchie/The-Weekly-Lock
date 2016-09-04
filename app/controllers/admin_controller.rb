class AdminController < ApplicationController

  def sport
    @sport = Sport.find_by_slug('nfl')
  end

  def season
    @season = Season.find_by_year(params[:year])
  end

  def week
    @week = Week.find_by_position(params[:week])
  end

  def game
    @game = Game.find_by_slug(params[:slug])
  end

end
