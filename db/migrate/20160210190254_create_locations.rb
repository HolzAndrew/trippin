class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :loc_long
      t.string :loc_lat
      t.string :address
      t.string :venue
      t.references :trip, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
