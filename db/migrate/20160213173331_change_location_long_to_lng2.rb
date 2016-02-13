class ChangeLocationLongToLng2 < ActiveRecord::Migration
  def change
    rename_column :locations, :loc_long, :loc_lng
  end
end
