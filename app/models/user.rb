class User < ActiveRecord::Base
  has_many :trip_user_lists
  belongs_to :trip, through: :trip_user_lists
  has_many :trips
  has_secure_password
end
