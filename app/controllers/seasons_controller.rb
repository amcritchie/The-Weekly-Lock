class SeasonsController < ApplicationController

  def new
    season = Season.create(season_params)
  end

  def index
    @seasons = Season.all
    @season = params[:id] ? Season.find(params[:id]) : Season.last
  end

  def record
    redirect_to root_path if !current_user
    @season = params[:id] ? Season.find(params[:id]) : Season.last
    @picks = @season.picks.where(user_id: current_user.id)
  end

  def public_record
    @season = params[:id] ? Season.find(params[:id]) : Season.last
    @picks = @season.picks.where(public_lock: true)
  end

  def build_matchups
    # @week = params[:week]
    # @season = params[:season]
    @season = Season.find_by_year(params[:year])

    Sdql.build_seasons_nfl_matchups(@season)
    render :json => {message: 'success'}
  end

  def build_results
    @season = Season.find_by_year(params[:year])
    Sdql.build_seasons_nfl_results(@season)
    render :json => {message: 'success'}
  end

  private

  def season_params
    params.require(:season).permit(:year, :sport_id)
  end
end
