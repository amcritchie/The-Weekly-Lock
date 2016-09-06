class Sdql
  def self.weeks
    # [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]
    [1,2,3,4,5,6,7,8]
  end

  def self.build_nfl_season(season)
    weeks.each do |position|
      puts "="*40
      puts "Week: #{position}"
      week = season.weeks.find_by_position(position) ? season.weeks.find_by_position(position) : Week.create(season_id: season.id, position: position)
      build_weeks_nfl_matchups(season, week)
      build_weeks_nfl_results(season, week)
    end
  end

  def self.build_weeks_nfl_matchups(season, week)
    sdql_url = "http://pdx1.sportsdatabase.com/nfl/query.json?sport=nfl&sdql=week%3D#{week.position}+and+season%3D#{season.year}"
    tbody_rows = html_performance_rows(sdql_url)

    puts "="*40
    puts "SDQL Url: #{sdql_url}"
    puts "Response: #{tbody_rows.length}"
    tbody_rows.each do |row|
      columns = row.split('</td>')
      if columns.length == 25
        build_performance_matchup(week, columns)
      else
        "Response to short for week #{week.position}"
      end
    end
  end

  def self.build_performance_matchup(week, html)
    date = html[0].split('>')[2]
    team = html[5].split('>')[1]
    spread = html[13].split('>')[1]

    team = Team.find_by_sdql_id(team.gsub(/\s+/, ""))
    if @home_team
      @game = Game.create(week_id: week.id, home_id: team.id, date: date)
      last_performance = @game.week.last_preformance_of_team(team.id) if @game.week.last_week
      new_record = last_performance ? last_performance.present_record : '0 0'

      Performance.create(game_id: @game.id, team_id: team.id, present_record: new_record, spread: spread, odds: -110, home: true)
    else
      @game.update(away_id: team.id, slug: "#{team.name.downcase}_at_#{@game.home_team.name.downcase}")
      last_performance = @game.week.last_preformance_of_team(team.id) if @game.week.last_week
      new_record = last_performance ? last_performance.present_record : '0 0'

      Performance.create(game_id: @game.id, team_id: team.id, present_record: new_record, spread: spread, odds: -110)

      puts "=" * 40
      puts "Game created - #{@game.id} - #{@game.away_team.name} @ #{@game.home_team.name} #{@game.date}"
    end
    @home_team = !@home_team
  end

  def self.build_seasons_nfl_results(season)
    weeks.each do |position|
      build_weeks_nfl_results(season, season.weeks.find_by_position(position))
    end
  end

  def self.build_weeks_nfl_results(season, week)
    sdql_url = "http://pdx1.sportsdatabase.com/nfl/query.json?sport=nfl&sdql=week%3D#{week.position}+and+season%3D#{season.year}"
    tbody_rows = html_performance_rows(sdql_url)
    puts "="*40
    puts "SDQL Url: #{sdql_url}"
    puts "Response: #{tbody_rows.length}"

    tbody_rows.each do |row|
      columns = row.split('</td>')
      if columns.length == 25
        build_performance_result(week, columns)
      end
    end
  end

  def self.calculate_result(total, opponent_total)
    if total > opponent_total
      'win'
    elsif total < opponent_total
      'loss'
    else
      'tie'
    end
  end

  def self.build_performance_result(week, html)

    date = html[0].split('>')[2]
    team = html[5].split('>')[1]
    opponent = html[6].split('>')[1]
    q1 = html[8].split('>')[1].split('-')[0].to_i
    q2 = html[9].split('>')[1].split('-')[0].to_i
    q3 = html[10].split('>')[1].split('-')[0].to_i
    q4 = html[11].split('>')[1].split('-')[0].to_i
    total = html[12].split('>')[2].split('-')[0].to_i
    opponent_total = html[12].split('>')[2].split('-')[1].to_i
    ot = total - (q1 + q2 + q3 + q4)

    result = calculate_result(total, opponent_total)
    team = Team.find_by_sdql_id(team.gsub(/\s+/, ""))

    if @home_team
      puts '---'
      puts week.id
      puts team.id
      puts '---'
      @game = Game.find_by(week_id: week.id, home_id: team.id)
      performance = @game.home_performance
      performance.update(q1: q1, q2: q2, q3: q3, q4: q4, ot: ot, total: total, result: result, present_record: performance.new_record(result))
    else
      performance = @game.away_performance
      performance.update(q1: q1, q2: q2, q3: q3, q4: q4, ot: ot, total: total, result: result, present_record: performance.new_record(result))

      puts "=" * 40
      puts "Game updated - #{@game.id} - #{@game.away_team.name} @ #{@game.home_team.name} ---> #{@game.away_team.name} #{result}"
    end
    @home_team = !@home_team
  end

  def self.sdql_response(url)
    require 'net/http'
    url = URI.parse(url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      # http.request(req)
      puts "=1"*100
      puts http.request(req).body.length
      puts http.request(req).body.length
      puts http.request(req).body.length
      puts http.request(req).body.length > 4000
      puts http.request(req).body.length
      puts "=2"*100
      if http.request(req).body.length > 4000
        http.request(req)
      else
        puts "sleep"
        sleep 4
        Net::HTTP.start(url.host, url.port) {|http|
          puts "=3"*100
          puts http.request(req).body.length
          puts "=4"*100
          http.request(req)
        }
      end
# 44831

      # byebug
    }
  end

  def self.table_rows(string)
    below_head = string.split('<thead>')[1]
    if below_head
      thead = below_head.split('</thead>')[0]
      thead_columns = thead.split('</td>')
      below_body = below_head.split('</thead>')[1]
      tbody = below_body.split('</table>')[0]
      tbody.split('</tr>')
    end
  end

  def self.html_performance_rows(route)
    @home_team = true
    res = sdql_response(route)
    puts '_1_'*40
    puts res.length
    puts '_2_'*40
    tbody_rows = table_rows(res.body)
    return tbody_rows ? tbody_rows : []
  end
end
