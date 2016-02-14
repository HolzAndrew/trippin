class Users < ActiveRecord::Migration
   def change
  	rename_column :locations, :loc_long, :loc_lng
  end
end
