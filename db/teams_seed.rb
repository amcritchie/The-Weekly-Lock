# AFC West
@broncos = Team.create(sport_id: @nfl.id, name: 'Broncos', location: 'Denver', slug: '', logo: Rails.root.join("app/assets/images/nfl/broncos.png").open)
@raiders = Team.create(sport_id: @nfl.id, name: 'Raiders', location: 'Oakland', slug: '', logo: '')
@chargers = Team.create(sport_id: @nfl.id, name: 'Chargers', location: 'San Diego', slug: '', logo: '')
@cheifs = Team.create(sport_id: @nfl.id, name: 'Chiefs', location: 'Kansas City', slug: '', logo: '')

# AFC East
@bills = Team.create(sport_id: @nfl.id, name: 'Bills', location: 'Buffalo', slug: '', logo: Rails.root.join("app/assets/images/nfl/bills.png").open)
@patriots = Team.create(sport_id: @nfl.id, name: 'Patriots', location: 'New England', slug: '', logo: Rails.root.join("app/assets/images/nfl/patriots.png").open)
@jets = Team.create(sport_id: @nfl.id, name: 'Jets', location: 'New York', slug: '', logo: '')
@dolphins = Team.create(sport_id: @nfl.id, name: 'Dolphins', location: 'Miami', slug: '', logo: '')

# AFC North
@bengals = Team.create(sport_id: @nfl.id, name: 'Bengals', location: 'Cincinnati', slug: '', logo: '')
@steelers = Team.create(sport_id: @nfl.id, name: 'Steelers', location: 'Pittsburgh', slug: '', logo: '')
@ravens = Team.create(sport_id: @nfl.id, name: 'Ravens', location: 'Baltimore', slug: '', logo: Rails.root.join("app/assets/images/nfl/ravens.png").open)
@browns = Team.create(sport_id: @nfl.id, name: 'Browns', location: 'Cleveland', slug: '', logo: '')

# AFC South
@colts = Team.create(sport_id: @nfl.id, name: 'Colts', location: 'Indianapolis', slug: '', logo: '')
@texans = Team.create(sport_id: @nfl.id, name: 'Texans', location: 'Houston', slug: '', logo: '')
@jaguars = Team.create(sport_id: @nfl.id, name: 'Jaguars', location: 'Jacksonville', slug: '', logo: '')
@titans = Team.create(sport_id: @nfl.id, name: 'Titans', location: 'Tennessee', slug: '', logo: '')

# NFC East
@cowboys = Team.create(sport_id: @nfl.id, name: 'Cowboys', location: 'Dallas', slug: '', logo: '')
@eagles = Team.create(sport_id: @nfl.id, name: 'Eagles', location: 'Philadelphia', slug: '', logo: '')
@redskins = Team.create(sport_id: @nfl.id, name: 'Redskins', location: 'Washington', slug: '', logo: Rails.root.join("app/assets/images/nfl/redskins.png").open)
@giants = Team.create(sport_id: @nfl.id, name: 'Giants', location: 'New York', slug: '', logo: '')

# NFC North
@vikings = Team.create(sport_id: @nfl.id, name: 'Vikings', location: 'Minnesota', slug: '', logo: Rails.root.join("app/assets/images/nfl/vikings.png").open)
@lions = Team.create(sport_id: @nfl.id, name: 'Lions', location: 'Detroit', slug: '', logo: '')
@packers = Team.create(sport_id: @nfl.id, name: 'Packers', location: 'Green Bay', slug: '', logo: '')
@bears = Team.create(sport_id: @nfl.id, name: 'Bears', location: 'Chicago', slug: '', logo: '')

# NFC South
@buccaneers = Team.create(sport_id: @nfl.id, name: 'Buccaneers', location: 'Tampa Bay', slug: '', logo: '')
@panthers = Team.create(sport_id: @nfl.id, name: 'Panthers', location: 'Carolina', slug: '', logo: Rails.root.join("app/assets/images/nfl/panthers.png").open)
@saints = Team.create(sport_id: @nfl.id, name: 'Saints', location: 'New Orleans', slug: '', logo: '')
@falcons = Team.create(sport_id: @nfl.id, name: 'Falcons', location: 'Atlanta', slug: '', logo: Rails.root.join("app/assets/images/nfl/falcons.png").open)

# NFC West
@fourtyniners = Team.create(sport_id: @nfl.id, name: '49ers', location: 'San Francisco', slug: '', logo: '')
@rams = Team.create(sport_id: @nfl.id, name: 'Rams', location: 'Los Angeles', slug: '', logo: '')
@cardinals = Team.create(sport_id: @nfl.id, name: 'Cardinals', location: 'Arizona', slug: '', logo: Rails.root.join("app/assets/images/nfl/cardinals.png").open)
@seahawks = Team.create(sport_id: @nfl.id, name: 'Seahawks', location: 'Seattle', slug: '', logo: '')
