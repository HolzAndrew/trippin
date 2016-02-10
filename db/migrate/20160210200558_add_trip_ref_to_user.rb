class AddTripRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :trip, index: true, foreign_key: true
  end
end
