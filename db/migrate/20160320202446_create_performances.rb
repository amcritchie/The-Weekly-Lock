class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :game_id
      t.integer :team_id
      t.string :present_record
      t.float :spread
      t.integer :odds
      t.boolean :home
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :ot
      t.integer :total
      t.string :result
    end
  end
end
