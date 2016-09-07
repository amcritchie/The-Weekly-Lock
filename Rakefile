# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :build_nfl_teams => :environment do

  # AFC West
  @broncos = Team.create(sport_id: @nfl.id, name: 'Broncos', sdql_id: 'Broncos', location: 'Denver', dark_color: '#002244', light_color: '#fb4f14', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/broncos.png').open)
  @raiders = Team.create(sport_id: @nfl.id, name: 'Raiders', sdql_id: 'Raiders', location: 'Oakland', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/raiders.gif').open)
  @chargers = Team.create(sport_id: @nfl.id, name: 'Chargers', sdql_id: 'Chargers', location: 'San Diego', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/chargers.png').open)
  @cheifs = Team.create(sport_id: @nfl.id, name: 'Chiefs', sdql_id: 'Chiefs', location: 'Kansas City', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/west/chiefs.png').open)

  # AFC East
  @bills = Team.create(sport_id: @nfl.id, name: 'Bills', sdql_id: 'Bills', location: 'Buffalo', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/bills.png').open)
  @patriots = Team.create(sport_id: @nfl.id, name: 'Patriots', sdql_id: 'Patriots', location: 'New England', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/patriots.png').open)
  @jets = Team.create(sport_id: @nfl.id, name: 'Jets', sdql_id: 'Jets', location: 'New York', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/jets.gif').open)
  @dolphins = Team.create(sport_id: @nfl.id, name: 'Dolphins', sdql_id: 'Dolphins', location: 'Miami', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/east/dolphins.png').open)

  # AFC North
  @bengals = Team.create(sport_id: @nfl.id, name: 'Bengals', sdql_id: 'Bengals', location: 'Cincinnati', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/bengals.gif').open)
  @steelers = Team.create(sport_id: @nfl.id, name: 'Steelers', sdql_id: 'Steelers', location: 'Pittsburgh', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/steelers.png').open)
  @ravens = Team.create(sport_id: @nfl.id, name: 'Ravens', sdql_id: 'Ravens', location: 'Baltimore', dark_color: '#241773', light_color: '#9E7C0C', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/ravens.png').open)
  @browns = Team.create(sport_id: @nfl.id, name: 'Browns', sdql_id: 'Browns', location: 'Cleveland', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/north/browns.png').open)

  # AFC South
  @colts = Team.create(sport_id: @nfl.id, name: 'Colts', sdql_id: 'Colts', location: 'Indianapolis', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/colts.png').open)
  @texans = Team.create(sport_id: @nfl.id, name: 'Texans', sdql_id: 'Texans', location: 'Houston', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/texans.png').open)
  @jaguars = Team.create(sport_id: @nfl.id, name: 'Jaguars', sdql_id: 'Jaguars', location: 'Jacksonville', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/jaguars.png').open)
  @titans = Team.create(sport_id: @nfl.id, name: 'Titans', sdql_id: 'Titans', location: 'Tennessee', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/afc/south/titans.png').open)

  # NFC East
  @cowboys = Team.create(sport_id: @nfl.id, name: 'Cowboys', sdql_id: 'Cowboys', location: 'Dallas', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/cowboys.gif').open)
  @eagles = Team.create(sport_id: @nfl.id, name: 'Eagles', sdql_id: 'Eagles', location: 'Philadelphia', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/eagles.png').open)
  @redskins = Team.create(sport_id: @nfl.id, name: 'Redskins', sdql_id: 'Redskins', location: 'Washington', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/redskins.png').open)
  @giants = Team.create(sport_id: @nfl.id, name: 'Giants', sdql_id: 'Giants', location: 'New York', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/east/giants.gif').open)

  # NFC North
  @vikings = Team.create(sport_id: @nfl.id, name: 'Vikings', sdql_id: 'Vikings', location: 'Minnesota', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/vikings.png').open)
  @lions = Team.create(sport_id: @nfl.id, name: 'Lions', sdql_id: 'Lions', location: 'Detroit', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/lions.png').open)
  @packers = Team.create(sport_id: @nfl.id, name: 'Packers', sdql_id: 'Packers', location: 'Green Bay', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/packers.png').open)
  @bears = Team.create(sport_id: @nfl.id, name: 'Bears', sdql_id: 'Bears', location: 'Chicago', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/north/bears.png').open)

  # NFC South
  @buccaneers = Team.create(sport_id: @nfl.id, name: 'Buccaneers', sdql_id: 'Buccaneers', location: 'Tampa Bay', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/buccaneers.png').open)
  @panthers = Team.create(sport_id: @nfl.id, name: 'Panthers', sdql_id: 'Panthers', location: 'Carolina', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/panthers.png').open)
  @saints = Team.create(sport_id: @nfl.id, name: 'Saints', sdql_id: 'Saints', location: 'New Orleans', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/saints.gif').open)
  @falcons = Team.create(sport_id: @nfl.id, name: 'Falcons', sdql_id: 'Falcons', location: 'Atlanta', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/south/falcons.png').open)

  # NFC West
  @fourtyniners = Team.create(sport_id: @nfl.id, name: '49ers', sdql_id: 'Fortyniners', location: 'San Francisco', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/49ers.gif').open)
  @rams = Team.create(sport_id: @nfl.id, name: 'Rams', sdql_id: 'Rams', location: 'Los Angeles', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/rams.png').open)
  @cardinals = Team.create(sport_id: @nfl.id, name: 'Cardinals', sdql_id: 'Cardinals', location: 'Arizona', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/cardinals.png').open)
  @seahawks = Team.create(sport_id: @nfl.id, name: 'Seahawks', sdql_id: 'Seahawks', location: 'Seattle', slug: '', logo: Rails.root.join('db', 'seeds', 'nfl/nfc/west/seahawks.png').open)
end
