class PicksController < ApplicationController
  def show
    @pick = params[:id] ? Pick.find(params[:id]) : Pick.last
    @game = @pick.game

    @last_three = @pick.previous_three

    # @season = params[:id] ? Season.find(params[:id]) : Season.last
    # @game = Game.first
    @team1 = Team.first
    @team2 = Team.find(5)
    @team3 = Team.find(11)
    @team4 = Team.find(26)
    @team5 = Team.find(28)
    @team6 = Team.find(31)
  end
end
