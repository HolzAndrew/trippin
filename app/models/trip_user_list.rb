class TripUserList < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  has_many :trips
  has_many :users
end
