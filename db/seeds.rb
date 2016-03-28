# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# rake db:drop db:create db:migrate db:seed

@nfl = Sport.create(name: 'National Football League', slug: 'nfl')

# Build NFL Teams
require File.expand_path('./db/teams_seed.rb')

@season_2015 = Season.create(sport_id: @nfl.id, year: 2015)

@week_1 = Week.create(season_id: @season_2015.id, position: 1)
@week_2 = Week.create(season_id: @season_2015.id, position: 2)
@week_3 = Week.create(season_id: @season_2015.id, position: 3)
@week_4 = Week.create(season_id: @season_2015.id, position: 4)
@week_5 = Week.create(season_id: @season_2015.id, position: 5)

@game_1_w1 = Game.create(week_id: @week_1.id, away_id: @ravens.id, home_id: @broncos.id)
@game_2_w1 = Game.create(week_id: @week_1.id, away_id: @bengals.id, home_id: @raiders.id)
@game_3_w1 = Game.create(week_id: @week_1.id, away_id: @browns.id, home_id: @jets.id)

@line_a_g1_w1 = Performance.create(game_id: @game_1_w1.id, team_id: @ravens.id, spread: 3.5, odds: -110)
@line_h_g1_w1 = Performance.create(game_id: @game_1_w1.id, team_id: @broncos.id, spread: -3.5, odds: -110, home: true)

@line_a_g2_w1 = Performance.create(game_id: @game_2_w1.id, team_id: @bengals.id, spread: 3.5, odds: -110)
@line_h_g2_w1 = Performance.create(game_id: @game_2_w1.id, team_id: @raiders.id, spread: -3.5, odds: -110, home: true)

@line_a_g3_w1 = Performance.create(game_id: @game_3_w1.id, team_id: @browns.id, spread: 3.5, odds: -110)
@line_h_g3_w1 = Performance.create(game_id: @game_3_w1.id, team_id: @jets.id, spread: -3.5, odds: -110, home: true)

@pick_g1_w1 = Pick.create(line_id: @line_h_g1_w1.id, public_lock: true)
@pick_g2_w1 = Pick.create(line_id: @line_a_g2_w1.id)
@pick_g3_w1 = Pick.create(line_id: @line_h_g3_w1.id)

@game_1_w2 = Game.create(week_id: @week_2.id, away_id: @broncos.id, home_id: @cheifs.id)
@game_1_w3 = Game.create(week_id: @week_3.id, away_id: @chargers.id, home_id: @vikings.id)
@game_1_w4 = Game.create(week_id: @week_4.id, away_id: @eagles.id, home_id: @redskins.id)
@game_1_w5 = Game.create(week_id: @week_5.id, away_id: @patriots.id, home_id: @cowboys.id)

@line_a_g1_w2 = Performance.create(game_id: @game_1_w2.id, team_id: @broncos.id, spread: 3.0, odds: -110)
@line_h_g1_w2 = Performance.create(game_id: @game_1_w2.id, team_id: @cheifs.id, spread: -3.0, odds: -110, home: true)
@pick_g1_w2 = Pick.create(line_id: @line_a_g1_w2.id, public_lock: true)

@line_a_g1_w3 = Performance.create(game_id: @game_1_w3.id, team_id: @chargers.id, spread: 2.0, odds: -110)
@line_h_g1_w3 = Performance.create(game_id: @game_1_w3.id, team_id: @vikings.id, spread: -2.0, odds: -110, home: true)
@pick_g1_w3 = Pick.create(line_id: @line_h_g1_w3.id, public_lock: true)

@line_a_g1_w4 = Performance.create(game_id: @game_1_w4.id, team_id: @eagles.id, spread: -3.0, odds: -110)
@line_h_g1_w4 = Performance.create(game_id: @game_1_w4.id, team_id: @redskins.id, spread: 3.0, odds: -110, home: true)
@pick_g1_w4 = Pick.create(line_id: @line_h_g1_w4.id, public_lock: true)

@line_a_g1_w5 = Performance.create(game_id: @game_1_w5.id, team_id: @patriots.id, spread: -8.5, odds: -110)
@line_h_g1_w5 = Performance.create(game_id: @game_1_w5.id, team_id: @cowboys.id, spread: 8.5, odds: -110, home: true)
@pick_g1_w5 = Pick.create(line_id: @line_a_g1_w5.id, public_lock: true)
