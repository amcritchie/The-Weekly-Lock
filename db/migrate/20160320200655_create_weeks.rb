class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :position
      t.integer :season_id
      t.boolean :matchup_built
      t.boolean :results_built
    end
  end
end
