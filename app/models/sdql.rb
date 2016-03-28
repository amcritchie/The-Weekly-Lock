class Sdql

  def self.build_weeks_nfl_results(season, week)
    res = sdql_response("http://pdx1.sportsdatabase.com/nfl/query.json?sport=nfl&sdql=week%3D#{week.position}+and+season%3D#{season.year}")
    tbody_rows = table_rows(res.body)
    tbody_rows.each do |row|
      columns = row.split('</td>')

      if columns.length == 25
        date = columns[0].split('>')[2]
        team = columns[5].split('>')[1]
        opponent = columns[6].split('>')[1]

        q1 = columns[8].split('>')[1].split('-')[0].to_i
        q2 = columns[9].split('>')[1].split('-')[0].to_i
        q3 = columns[10].split('>')[1].split('-')[0].to_i
        q4 = columns[11].split('>')[1].split('-')[0].to_i

        total = columns[12].split('>')[2].split('-')[0].to_i
        ot = total - (q1 + q2 + q3 + q4)

        # preformance = Preformance.find by season, week, and sdql_id
        # preformance.update(q1: q1, q2: q2, q3: q3, q4: q4, ot: ot, total: total)

        # puts "---game"
        # puts date
        # puts team
        # puts opponent
        # puts "q1: #{q1}, q2: #{q2}, q3: #{q3}, q4: #{q4}"
        # puts "ot: #{ot}, total: #{total}"
        # puts "---end"
      end
    end
  end

  def self.build_weeks_nfl_matchups(season, week)
    season = Season.find_by_year(2015)
    week = season.weeks.find_by_position(week)
    game = nil;
    home_team = true

    res = sdql_response("http://pdx1.sportsdatabase.com/nfl/query.json?sport=nfl&sdql=week%3D#{week.position}+and+season%3D#{season.year}")
    tbody_rows = table_rows(res.body)
    tbody_rows.each do |row|
      columns = row.split('</td>')

      if columns.length == 25
        date = columns[0].split('>')[2]
        team = columns[5].split('>')[1]
        spread = columns[13].split('>')[1]

        team = Team.find_by_sdql_id(team.gsub(/\s+/, ""))
        if home_team
          game = Game.create(week_id: week.id, home_id: team.id, date: date)
          Performance.create(game_id: game.id, team_id: team.id, spread: spread, odds: -110, home: true)
        else
          game.update(away_id: team.id)
          Performance.create(game_id: game.id, team_id: team.id, spread: spread, odds: -110)
          puts "=" * 40
          puts "Game created - #{game.away_team.name} @ #{game.home_team.name} #{game.date}"
          puts "=" * 40
        end
        home_team = !home_team
      end
    end
  end

  def self.sdql_response(url)
    require 'net/http'
    url = URI.parse(url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
  end

  def self.table_rows(string)
    below_head = string.split('<thead>')[1]
    thead = below_head.split('</thead>')[0]
    thead_columns = thead.split('</td>')
    below_body = below_head.split('</thead>')[1]
    tbody = below_body.split('</table>')[0]
    tbody.split('</tr>')
  end
end
