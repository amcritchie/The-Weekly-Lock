class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
    @season = params[:id] ? Season.find(params[:id]) : Season.last
  end
end
