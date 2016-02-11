class Trips < ActiveRecord::Migration
  def change
    rename_column :trips, :long, :lng
  end
end
