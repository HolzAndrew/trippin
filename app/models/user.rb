class User < ActiveRecord::Base
  has_many :trip_user_lists

  has_and_belongs_to_many :trips
  belongs_to :trip
  has_many :trips

  has_secure_password
end
