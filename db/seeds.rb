# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# rake db:drop db:create db:migrate db:seed

@nfl = Sport.create(name: 'National Football League', slug: 'nfl')

# Build NFL Teams
require File.expand_path('./db/teams_seed.rb')

@season_2015 = Season.create(sport_id: @nfl.id, year: 2015)

@week_1 = Week.create(season_id: @season_2015.id, position: 1)

@game_1_w1 = Game.create(away_id: @ravens.id, home_id: @broncos.id)
@game_2_w1 = Game.create(away_id: @bengals.id, home_id: @raiders.id)
@game_3_w1 = Game.create(away_id: @browns.id, home_id: @jets.id)

@line_a_g1_w1 = Line.create(game_id: @game_1_w1.id, team_id: @ravens.id, spread: 35, odds: -110)
@line_h_g1_w1 = Line.create(game_id: @game_1_w1.id, team_id: @broncos.id, spread: -35, odds: -110, home: true)

@line_a_g2_w1 = Line.create(game_id: @game_2_w1.id, team_id: @bengals.id, spread: 35, odds: -110)
@line_h_g2_w1 = Line.create(game_id: @game_2_w1.id, team_id: @raiders.id, spread: -35, odds: -110, home: true)

@line_a_g3_w1 = Line.create(game_id: @game_3_w1.id, team_id: @browns.id, spread: 35, odds: -110)
@line_h_g3_w1 = Line.create(game_id: @game_3_w1.id, team_id: @jets.id, spread: -35, odds: -110, home: true)

@pick_g1_w1 = Pick.create(line_id: @line_h_g1_w1.id, public_lock: true)
@pick_g2_w1 = Pick.create(line_id: @line_a_g2_w1.id)
@pick_g3_w1 = Pick.create(line_id: @line_h_g3_w1.id)
