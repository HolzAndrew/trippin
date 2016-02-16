class User < ActiveRecord::Base
  has_many :trip_user_lists

  belongs_to :trip
  has_many :trips
  has_many :comments

  has_secure_password
end
