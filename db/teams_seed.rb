# AFC West
@broncos = Team.create(sport_id: @nfl.id, name: 'Broncos', sdql_id: 'Broncos', location: 'Denver', slug: '', logo: Rails.root.join("app/assets/images/nfl/broncos.png").open)
@raiders = Team.create(sport_id: @nfl.id, name: 'Raiders', sdql_id: 'Raiders', location: 'Oakland', slug: '', logo: '')
@chargers = Team.create(sport_id: @nfl.id, name: 'Chargers', sdql_id: 'Chargers', location: 'San Diego', slug: '', logo: '')
@cheifs = Team.create(sport_id: @nfl.id, name: 'Chiefs', sdql_id: 'Chiefs', location: 'Kansas City', slug: '', logo: '')

# AFC East
@bills = Team.create(sport_id: @nfl.id, name: 'Bills', sdql_id: 'Bills', location: 'Buffalo', slug: '', logo: Rails.root.join("app/assets/images/nfl/bills.png").open)
@patriots = Team.create(sport_id: @nfl.id, name: 'Patriots', sdql_id: 'Patriots', location: 'New England', slug: '', logo: Rails.root.join("app/assets/images/nfl/patriots.png").open)
@jets = Team.create(sport_id: @nfl.id, name: 'Jets', sdql_id: 'Jets', location: 'New York', slug: '', logo: '')
@dolphins = Team.create(sport_id: @nfl.id, name: 'Dolphins', sdql_id: 'Dolphins', location: 'Miami', slug: '', logo: '')

# AFC North
@bengals = Team.create(sport_id: @nfl.id, name: 'Bengals', sdql_id: 'Bengals', location: 'Cincinnati', slug: '', logo: '')
@steelers = Team.create(sport_id: @nfl.id, name: 'Steelers', sdql_id: 'Steelers', location: 'Pittsburgh', slug: '', logo: '')
@ravens = Team.create(sport_id: @nfl.id, name: 'Ravens', sdql_id: 'Ravens', location: 'Baltimore', slug: '', logo: Rails.root.join("app/assets/images/nfl/ravens.png").open)
@browns = Team.create(sport_id: @nfl.id, name: 'Browns', sdql_id: 'Browns', location: 'Cleveland', slug: '', logo: '')

# AFC South
@colts = Team.create(sport_id: @nfl.id, name: 'Colts', sdql_id: 'Colts', location: 'Indianapolis', slug: '', logo: '')
@texans = Team.create(sport_id: @nfl.id, name: 'Texans', sdql_id: 'Texans', location: 'Houston', slug: '', logo: '')
@jaguars = Team.create(sport_id: @nfl.id, name: 'Jaguars', sdql_id: 'Jaguars', location: 'Jacksonville', slug: '', logo: '')
@titans = Team.create(sport_id: @nfl.id, name: 'Titans', sdql_id: 'Titans', location: 'Tennessee', slug: '', logo: '')

# NFC East
@cowboys = Team.create(sport_id: @nfl.id, name: 'Cowboys', sdql_id: 'Cowboys', location: 'Dallas', slug: '', logo: '')
@eagles = Team.create(sport_id: @nfl.id, name: 'Eagles', sdql_id: 'Eagles', location: 'Philadelphia', slug: '', logo: '')
@redskins = Team.create(sport_id: @nfl.id, name: 'Redskins', sdql_id: 'Redskins', location: 'Washington', slug: '', logo: Rails.root.join("app/assets/images/nfl/redskins.png").open)
@giants = Team.create(sport_id: @nfl.id, name: 'Giants', sdql_id: 'Giants', location: 'New York', slug: '', logo: '')

# NFC North
@vikings = Team.create(sport_id: @nfl.id, name: 'Vikings', sdql_id: 'Vikings', location: 'Minnesota', slug: '', logo: Rails.root.join("app/assets/images/nfl/vikings.png").open)
@lions = Team.create(sport_id: @nfl.id, name: 'Lions', sdql_id: 'Lions', location: 'Detroit', slug: '', logo: '')
@packers = Team.create(sport_id: @nfl.id, name: 'Packers', sdql_id: 'Packers', location: 'Green Bay', slug: '', logo: '')
@bears = Team.create(sport_id: @nfl.id, name: 'Bears', sdql_id: 'Bears', location: 'Chicago', slug: '', logo: '')

# NFC South
@buccaneers = Team.create(sport_id: @nfl.id, name: 'Buccaneers', sdql_id: 'Buccaneers', location: 'Tampa Bay', slug: '', logo: '')
@panthers = Team.create(sport_id: @nfl.id, name: 'Panthers', sdql_id: 'Panthers', location: 'Carolina', slug: '', logo: Rails.root.join("app/assets/images/nfl/panthers.png").open)
@saints = Team.create(sport_id: @nfl.id, name: 'Saints', sdql_id: 'Saints', location: 'New Orleans', slug: '', logo: '')
@falcons = Team.create(sport_id: @nfl.id, name: 'Falcons', sdql_id: 'Falcons', location: 'Atlanta', slug: '', logo: Rails.root.join("app/assets/images/nfl/falcons.png").open)

# NFC West
@fourtyniners = Team.create(sport_id: @nfl.id, name: '49ers', sdql_id: 'Fortyniners', location: 'San Francisco', slug: '', logo: '')
@rams = Team.create(sport_id: @nfl.id, name: 'Rams', sdql_id: 'Rams', location: 'Los Angeles', slug: '', logo: '')
@cardinals = Team.create(sport_id: @nfl.id, name: 'Cardinals', sdql_id: 'Cardinals', location: 'Arizona', slug: '', logo: Rails.root.join("app/assets/images/nfl/cardinals.png").open)
@seahawks = Team.create(sport_id: @nfl.id, name: 'Seahawks', sdql_id: 'Seahawks', location: 'Seattle', slug: '', logo: '')
