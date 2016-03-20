class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :line_id
      t.string :slug
      t.text :notes
      t.boolean :public_lock
    end
  end
end
