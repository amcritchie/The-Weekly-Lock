class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :week_id
      t.integer :home_id
      t.integer :away_id
    end
  end
end
