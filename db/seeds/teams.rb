
# AFC West
@broncos = Team.create(sport_id: @nfl.id, name: 'Broncos', sdql_id: 'Broncos', location: 'Denver', primary_color: '#FB4F14', secondary_color: '#002244', dark_color: '#002244', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/broncos.png').open)
@raiders = Team.create(sport_id: @nfl.id, name: 'Raiders', sdql_id: 'Raiders', location: 'Oakland', primary_color: '#000000', secondary_color: '#A5ACAF', dark_color: '#000000', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/raiders.gif').open)
@chargers = Team.create(sport_id: @nfl.id, name: 'Chargers', sdql_id: 'Chargers', location: 'San Diego', primary_color: '#0073CF', secondary_color: '#FFB612', dark_color: '#002244', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/chargers.png').open)
@cheifs = Team.create(sport_id: @nfl.id, name: 'Chiefs', sdql_id: 'Chiefs', location: 'Kansas City', primary_color: '#E31837', secondary_color: '#FFB612', dark_color: '#E31837', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/chiefs.png').open)

# AFC East
@bills = Team.create(sport_id: @nfl.id, name: 'Bills', sdql_id: 'Bills', location: 'Buffalo', primary_color: '#00338D', secondary_color: '#C60C30', dark_color: '#00338D', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/bills.png').open)
@patriots = Team.create(sport_id: @nfl.id, name: 'Patriots', sdql_id: 'Patriots', location: 'New England', primary_color: '#002244', secondary_color: '#C60C30', dark_color: '#002244', light_color: '#B0B7BC', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/patriots.png').open)
@jets = Team.create(sport_id: @nfl.id, name: 'Jets', sdql_id: 'Jets', location: 'New York', primary_color: '#203731', secondary_color: '#FFFFFF', dark_color: '#203731', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/jets.gif').open)
@dolphins = Team.create(sport_id: @nfl.id, name: 'Dolphins', sdql_id: 'Dolphins', location: 'Miami', primary_color: '#008E97', secondary_color: '#F58220', dark_color: '#005778', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/dolphins.png').open)

# AFC North
@bengals = Team.create(sport_id: @nfl.id, name: 'Bengals', sdql_id: 'Bengals', location: 'Cincinnati', primary_color: '#FB4F14', secondary_color: '#000000', dark_color: '#000000', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/bengals.gif').open)
@steelers = Team.create(sport_id: @nfl.id, name: 'Steelers', sdql_id: 'Steelers', location: 'Pittsburgh', primary_color: '#000000', secondary_color: '#FFB612', dark_color: '#000000', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/steelers.png').open)
@ravens = Team.create(sport_id: @nfl.id, name: 'Ravens', sdql_id: 'Ravens', location: 'Baltimore', primary_color: '#241773', secondary_color: '#9E7C0C', dark_color: '#000000', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/ravens.png').open)
@browns = Team.create(sport_id: @nfl.id, name: 'Browns', sdql_id: 'Browns', location: 'Cleveland', primary_color: '#FB4F14', secondary_color: '#22150C', dark_color: '#22150C', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/browns.png').open)

# AFC South
@colts = Team.create(sport_id: @nfl.id, name: 'Colts', sdql_id: 'Colts', location: 'Indianapolis', primary_color: '#002C5F', secondary_color: '#A5ACAF', dark_color: '#002C5F', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/colts.png').open)
@texans = Team.create(sport_id: @nfl.id, name: 'Texans', sdql_id: 'Texans', location: 'Houston', primary_color: '#02253A', secondary_color: '#A71930', dark_color: '#02253A', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/texans.png').open)
@jaguars = Team.create(sport_id: @nfl.id, name: 'Jaguars', sdql_id: 'Jaguars', location: 'Jacksonville', primary_color: '#006778', secondary_color: '#9F792C', dark_color: '#000000', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/jaguars.png').open)
@titans = Team.create(sport_id: @nfl.id, name: 'Titans', sdql_id: 'Titans', location: 'Tennessee', primary_color: '#4B92DB', secondary_color: '#C60C30', dark_color: '#002244', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/titans.png').open)

# NFC East
@cowboys = Team.create(sport_id: @nfl.id, name: 'Cowboys', sdql_id: 'Cowboys', location: 'Dallas', primary_color: '#002244', secondary_color: '#B0B7BC', dark_color: '#002244', light_color: '#ACC0C6', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/cowboys.gif').open)
@eagles = Team.create(sport_id: @nfl.id, name: 'Eagles', sdql_id: 'Eagles', location: 'Philadelphia', primary_color: '#004953', secondary_color: '#A5ACAF', dark_color: '#000000', light_color: '#ACC0C6', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/eagles.png').open)
@redskins = Team.create(sport_id: @nfl.id, name: 'Redskins', sdql_id: 'Redskins', location: 'Washington', primary_color: '#773141', secondary_color: '#FFB612', dark_color: '#000000', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/redskins.png').open)
@giants = Team.create(sport_id: @nfl.id, name: 'Giants', sdql_id: 'Giants', location: 'New York', primary_color: '#0B2265', secondary_color: '#A71930', dark_color: '#0B2265', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/giants.gif').open)

# NFC North
@vikings = Team.create(sport_id: @nfl.id, name: 'Vikings', sdql_id: 'Vikings', location: 'Minnesota', primary_color: '#4F2683', secondary_color: '#FFC62F', dark_color: '#000000', light_color: '#FFC62F', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/vikings.png').open)
@lions = Team.create(sport_id: @nfl.id, name: 'Lions', sdql_id: 'Lions', location: 'Detroit', primary_color: '#005A8B', secondary_color: '#B0B7BC', dark_color: '#000000', light_color: '#B0B7BC', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/lions.png').open)
@packers = Team.create(sport_id: @nfl.id, name: 'Packers', sdql_id: 'Packers', location: 'Green Bay', primary_color: '#203731', secondary_color: '#FFB612', dark_color: '#203731', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/packers.png').open)
@bears = Team.create(sport_id: @nfl.id, name: 'Bears', sdql_id: 'Bears', location: 'Chicago', primary_color: '#0B162A', secondary_color: '#C83803', dark_color: '#0B162A', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/bears.png').open)

# NFC South
@buccaneers = Team.create(sport_id: @nfl.id, name: 'Buccaneers', sdql_id: 'Buccaneers', location: 'Tampa Bay', primary_color: '#D50A0A', secondary_color: '#34302B', dark_color: '#34302B', light_color: '#B1BABF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/buccaneers.png').open)
@panthers = Team.create(sport_id: @nfl.id, name: 'Panthers', sdql_id: 'Panthers', location: 'Carolina', primary_color: '#0085CA', secondary_color: '#000000', dark_color: '#000000', light_color: '#BFC0BF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/panthers.png').open)
@saints = Team.create(sport_id: @nfl.id, name: 'Saints', sdql_id: 'Saints', location: 'New Orleans', primary_color: '#9F8958', secondary_color: '#000000', dark_color: '#000000', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/saints.gif').open)
@falcons = Team.create(sport_id: @nfl.id, name: 'Falcons', sdql_id: 'Falcons', location: 'Atlanta', primary_color: '#A71930', secondary_color: '#000000', dark_color: '#000000', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/falcons.png').open)

# NFC West
@fourtyniners = Team.create(sport_id: @nfl.id, name: '49ers', sdql_id: 'Fortyniners', location: 'San Francisco', primary_color: '#AA0000', secondary_color: '#B3995D', dark_color: '#000000', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/49ers.gif').open)
@rams = Team.create(sport_id: @nfl.id, name: 'Rams', sdql_id: 'Rams', location: 'Los Angeles', primary_color: '#002244', secondary_color: '#B3995D', dark_color: '#002244', light_color: '#FFFFFF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/rams.png').open)
@cardinals = Team.create(sport_id: @nfl.id, name: 'Cardinals', sdql_id: 'Cardinals', location: 'Arizona', primary_color: '#97233F', secondary_color: '#FFB612', dark_color: '#000000', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/cardinals.png').open)
@seahawks = Team.create(sport_id: @nfl.id, name: 'Seahawks', sdql_id: 'Seahawks', location: 'Seattle', primary_color: '#002244', secondary_color: '#69BE28', dark_color: '#002244', light_color: '#A5ACAF', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/seahawks.png').open)
