class SeasonsController < ApplicationController
  def index
    @season = params[:id] ? Season.find(params[:id]) : Season.last
  end
end
