class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :spread
      t.integer :odds
      t.boolean :home
    end
  end
end
