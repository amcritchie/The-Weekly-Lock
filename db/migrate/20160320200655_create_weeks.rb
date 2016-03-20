class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :position
      t.integer :season_id
    end
  end
end
