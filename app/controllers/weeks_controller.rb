class WeeksController < ApplicationController

  def index
    @season = params[:year] ? Season.find_by_year(params[:year]) : Season.last
    @weeks = @season.weeks
  end

  def build_result
    @week = params[:week]
    @season = params[:season]
  end

  def build_matchups
    @week = params[:week]
    @season = params[:season]
    Sdql.build_weeks_nfl_matchups(@season, @week)
    render :json => {message: 'success'}
  end
end
