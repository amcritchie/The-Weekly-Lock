# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# rake db:drop db:create db:migrate db:seed

@nfl = Sport.create(name: 'National Football League', slug: 'nfl')

# Build NFL Teams
require File.expand_path('./db/seeds/teams.rb')

@season_2013 = Season.create(sport_id: @nfl.id, year: 2013)
Sdql.build_nfl_season(@season_2013)

@season_2014 = Season.create(sport_id: @nfl.id, year: 2014)
Sdql.build_nfl_season(@season_2014)

@season_2015 = Season.create(sport_id: @nfl.id, year: 2015)
Sdql.build_nfl_season(@season_2015)

@pick_g3_w1 = Pick.create(performance_id: Performance.last.id)
