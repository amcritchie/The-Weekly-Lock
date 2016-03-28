class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.string :slug
      t.string :logo
      t.string :sdql_id
      t.integer :sport_id
    end
  end
end
