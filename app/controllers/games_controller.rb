class GamesController < ApplicationController
  require 'enumerable'

  def read
    @season = params[:year] ? Season.find_by_year(params[:year]) : Season.last
    puts '-'*100
    puts params[:week]
    puts '-'*100
    puts @season
    puts '-'*100
    puts @season.weeks
    puts '-'*100
    @week = @season.weeks.find_by_position(params[:week])
    @game = @week.games.find_by_slug(params[:slug])
    # @games = @game.home_performance.last_five.map(&:game)
    @gamess = []
    @games = @game.home_performance.last_five
    @home_games = @game.home_performance.last_five
    @away_games = @game.away_performance.last_five

    # home_first_half_score = 0;
    # away_first_half_score = 0;

    home_first_half_scores = []
    away_first_half_scores = []
    home_second_half_scores = []
    away_second_half_scores = []

    first_half_score = 0;
    second_half_score = 0;

    score_comparison = []

    @home_games.each_with_index do |game, index|
      puts "="*100
      puts index
      puts "="*100
      away_performance = @away_games[index]
      if away_performance
        puts away_performance
        puts "----Home First Half----"
        puts game[:performance]
        puts game[:halfs]
        puts game[:halfs][:first]
        puts "----Away First Half----"
        puts away_performance[:halfs][:first]

        if game[:halfs][:first] && away_performance[:halfs][:first]
          first_half_score += (game[:halfs][:first] - away_performance[:halfs][:first])
          second_half_score += (game[:halfs][:second] - away_performance[:halfs][:second])

          home_first_half_scores.push(game[:halfs][:first])
          away_first_half_scores.push(away_performance[:halfs][:first])
          home_second_half_scores.push(game[:halfs][:second])
          away_second_half_scores.push(away_performance[:halfs][:second])
          # first_half_score += (game[:halfs][:first] - away_performance[:halfs][:first])
          score_comparison.push({
            first: (game[:halfs][:first] - away_performance[:halfs][:first]),
            second: (game[:halfs][:second] - away_performance[:halfs][:second])
            })
        end



      end
      puts "=+="*40
      puts score_comparison
      a = [ 20, 23, 23, 24, 25, 22, 12, 21, 29 ]
      puts a.standard_deviation
      puts "=^="*40
      # puts "="*100
      puts "Home First Half SD: #{home_first_half_scores.standard_deviation}"
      puts "Away First Half SD: #{away_first_half_scores.standard_deviation}"
      puts "Home Second Half SD: #{home_second_half_scores.standard_deviation}"
      puts "Away Second Half SD: #{away_second_half_scores.standard_deviation}"
      # puts "First Half SD: #{home_first_half_scores.standard_deviation}"
      # puts "First Half SD: #{home_first_half_scores.standard_deviation}"
      # puts home_first_half_scores.standard_deviation
      # puts away_first_half_scores.standard_deviation
      # puts home_second_half_scores.standard_deviation
      # puts away_second_half_scores.standard_deviation

      puts "=*="*40
      puts "Negative means away is favored."
      puts first_half_score
      puts second_half_score
      puts "=-="*40
    end
    # puts "---hello-" * 100
    # @games = @week.games
  end

  def index
    @season = params[:year] ? Season.find_by_year(params[:year]) : Season.last
    @week = @season.weeks.find_by_position(params[:week])
    @games = @week.games
  end

end
