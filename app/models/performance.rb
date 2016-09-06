class Performance < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :pick

  def record_after_performance_xz
    record_x = self.present_record.split
    if self.result.nil?
      "Performance doesn't have result" * 1000
      puts "Performance.id: #{self.id}"
      "Performance doesn't have result" * 100
      return false
      # return "Performance not finished - icode:S001"
    end
    # byebug if self.id == 33
    if self.result == 'win'
      record_x[0] = record_x[0].to_i + 1
    elsif self.result =='loss'
      record_x[1] = record_x[1].to_i + 1
    else
      if record_x[2].nil?
        record_x[2] = 1
      else
        record_x[2] = record_x[2].to_i + 1
      end
    end
    record_x.join(' ')
  end

  def last_performance
    c_week = self.game.week
    until c_week.performances.find_by_team_id(self.team.id) do
      c_week = c_week.last_week
    end
    c_week.performances.find_by_team_id(self.team.id)
  end

  def new_record(result)
    record_x = self.present_record.split
    previous_record = self.last_performance.present_record.split
    if result.nil?
      "Performance doesn't have result" * 1000
      puts "Performance.id: #{self.id}"
      "Performance doesn't have result" * 100
      return false
      # return "Performance not finished - icode:S001"
    end
    # byebug if self.id == 33
    if result == 'win'
      record_x[0] = record_x[0].to_i + 1
    elsif result =='loss'
      record_x[1] = record_x[1].to_i + 1
    else
      if record_x[2].nil?
        record_x[2] = 1
      else
        record_x[2] = record_x[2].to_i + 1
      end
    end
    record_x.join(' ')
  end

  def record_after_performance
    record_x = self.present_record.split
    previous_record = self.last_performance.present_record.split
    if self.result.nil?
      "Performance doesn't have result" * 1000
      puts "Performance.id: #{self.id}"
      "Performance doesn't have result" * 100
      return false
      # return "Performance not finished - icode:S001"
    end
    # byebug if self.id == 33
    if self.result == 'win'
      record_x[0] = record_x[0].to_i + 1
    elsif self.result =='loss'
      record_x[1] = record_x[1].to_i + 1
    else
      if record_x[2].nil?
        record_x[2] = 1
      else
        record_x[2] = record_x[2].to_i + 1
      end
    end
    record_x.join(' ')
  end

  def won
    if self.home
      puts "++++++++++++"
      puts self
      puts self.game
      puts self.game.away_performance.to_json
      puts self.game.away_performance.total
      puts "++++++++++++"
      self.game.away_performance.total > self.game.home_performance.total
    else
      self.game.away_performance.total < self.game.home_performance.total
    end
  end

  def result_x
    puts "+1+2+1"*200
    puts self.game.away_performance.to_json
    puts "+1+2+2"*20
    puts self.game.home_performance.to_json
    puts "+1+2+3"*20
    puts "+1+2+4"*20
    if self.game.away_performance.total.nil? || self.game.home_performance.total.nil?
      return 'Totals are not rocrded.'
    end

    if self.game.away_performance.total == self.game.home_performance.total
      'tie'
    elsif self.home
      if self.game.away_performance.total < self.game.home_performance.total
        'win'
      else
        'loss'
      end
    else
      if self.game.away_performance.total > self.game.home_performance.total
        'win'
      else
        'loss'
      end
    end
  end

  def record_x
    self.game
    self.team
    self.game.week

    current_week = self.game.week
    record_x = []
    record = {
      wins: 0,
      losses: 0,
      ties: 0
    }

    until !current_week.last_week do
      puts "="*20
      # puts current_week
      current_week = current_week.last_week
      # puts "=_1"*20
      # puts current_week.to_json
      # puts "=_2"*20
      # puts current_week.performances
      # puts "=_3"*20
      # puts current_week.performances.find_by_team_id(self.team_id)
      # puts "=_4"*20
      # puts self.team_id
      # puts "=_5"*20

      teams_performance = current_week.performances.find_by_team_id(self.team_id)
      puts "Week: #{current_week.position}"
      if teams_performance
        puts "Team played"
        puts teams_performance.result
        puts "____"
        puts "____"
        puts "____"
        if teams_performance.result == 'loss'
          record[:losses] += 1
        elsif teams_performance.result == 'win'
          record[:wins] += 1
        elsif teams_performance.result == 'tie'
          puts "iterate ties"
          record[:ties] += 1
        end
      end


      # if current_week.performances.find_by_team_id(self.team_id) && current_week.performances.find_by_team_id(self.team_id).won
      #   record_x.push(1)
      # else
      #   record_x.push(0)
      # end
    end
    puts "-"*40
    puts record_x
    puts "-"*40
    record
  end

  def q1_matchup
    opposition = self.opposition
    last_five = opposition.last_five
    opposition
  end

  def opposition
    game = self.game
    if self == self.game.home_performance
      game.away_performance
    else
      game.home_performance
    end
  end

  def the_score
    score_comparison = []
    home_first_half_scores = []
    away_first_half_scores = []
    home_second_half_scores = []
    away_second_half_scores = []
    first_half_score = 0
    second_half_score = 0
    @away_games = self.opposition.last_five

    self.last_five.each_with_index do |game, index|
      away_performance = @away_games[index]
      if away_performance

        if game[:halfs][:first] && away_performance[:halfs][:first]
          # first_half_score += (game[:halfs][:first] - away_performance[:halfs][:first]) * (1.8 - index/20)
          # second_half_score += (game[:halfs][:second] - away_performance[:halfs][:second]) * (1.8 - index/20)
          first_half_score += (game[:halfs][:first] - away_performance[:halfs][:first])
          second_half_score += (game[:halfs][:second] - away_performance[:halfs][:second])

          home_first_half_scores.push(game[:halfs][:first])
          away_first_half_scores.push(away_performance[:halfs][:first])

          home_second_half_scores.push(game[:halfs][:second])
          away_second_half_scores.push(away_performance[:halfs][:second])

          score_comparison.push({
            first: (game[:halfs][:first] - away_performance[:halfs][:first]),
            second: (game[:halfs][:second] - away_performance[:halfs][:second])
            })
          end
        end
      end
      {
        score: score_comparison,
        # first_half_score: first_half_score,
        # first_half_score: first_half_score/(home_first_half_scores.standard_deviation + away_first_half_scores.standard_deviation),
        # # second_half_score: second_half_score,
        # second_half_score: second_half_score/(home_second_half_scores.standard_deviation + away_second_half_scores.standard_deviation),
        home: {
          first_half_sd: home_first_half_scores.standard_deviation,
          second_half_sd: home_second_half_scores.standard_deviation
        },
        away: {
          first_half_sd: away_first_half_scores.standard_deviation,
          second_half_sd: away_second_half_scores.standard_deviation
        }
      }
    end

    def last_five
      week = self.game.week
      position = self.game.week.position

      performances = []

      # while $i < $num  do
      while 0 < position && performances.length < 5 do
        # while 0 < position && performances.length < 3 do
        position -=1

        # puts("Inside the loop i = #$i" )
        $week = Week.find_by_position(position)
        if $week
          $performance = $week.performances.find_by_team_id(self.team.id)
          if $performance
            $opposition = $performance.opposition
            $quarter_spread = $performance.spread/4.0
            $half_spread = $performance.spread/2.0

            # performances.push({
            #   game: $performance.game,
            #   performance: $performance,
            #   opposition: $performance.opposition,
            #   halfs: {
            #     first_0: ($performance.q1 + $performance.q2 + $half_spread)/($opposition.q1 + $opposition.q2),
            #     second_0: ($performance.q3 + $performance.q4 + $half_spread)/($opposition.q3 + $opposition.q4),
            #     first: ($performance.q1 + $performance.q2 + $half_spread) - ($opposition.q1 + $opposition.q2),
            #     second: ($performance.q3 + $performance.q4 + $half_spread) - ($opposition.q3 + $opposition.q4)
            #   },
            #   quarters: {
            #     q1: (($performance.q1 - $opposition.q1) + $quarter_spread),
            #     q2: (($performance.q2 - $opposition.q2) + $quarter_spread),
            #     q3: (($performance.q3 - $opposition.q3) + $quarter_spread),
            #     q4: (($performance.q4 - $opposition.q4) + $quarter_spread),
            #     total: (($performance.total - $opposition.total) + $quarter_spread),
            #   }
            #   })

            # quarter_analysis = ($performance.q1 + $quarter_spread)/$opposition.q1
            quarter_score = 0

          end
        end
      end
      performances
    end
  end
