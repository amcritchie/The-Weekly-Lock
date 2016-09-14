class WeeksController < ApplicationController

  def pick_latest
    @week = Week.latest_week
  end

  def index
    @season = params[:year] ? Season.find_by_year(params[:year]) : Season.last
    @weeks = @season.weeks
  end

  def build_result
    @week = params[:week]
    @season = params[:season]
  end

  def build_matchups
    @season = Season.find_by_year(params[:year])
    @week = @season.weeks.find_by_position(params[:week])
    Sdql.build_weeks_nfl_matchups(@season, @week)
    render :json => {message: 'success'}
  end

  def build_results
    @season = Season.find_by_year(params[:year])
    @week = @season.weeks.find_by_position(params[:week])

    Sdql.build_weeks_nfl_results(@season, @week)
    render :json => {message: 'success'}
  end
end
