class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :performance_id
      t.string :slug
      t.text :notes
      t.boolean :public_lock
    end
  end
end
