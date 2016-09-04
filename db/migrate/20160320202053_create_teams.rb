class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.string :slug
      t.string :logo
      t.string :dark_color
      t.string :light_color
      t.string :sdql_id
      t.integer :sport_id
    end
  end
end
