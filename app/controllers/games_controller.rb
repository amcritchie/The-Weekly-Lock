class GamesController < ApplicationController

  def index
    @season = params[:year] ? Season.find_by_year(params[:year]) : Season.last
    @week = @season.weeks.find_by_position(params[:week])
    @games = @week.games
  end

end
