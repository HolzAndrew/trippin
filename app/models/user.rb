class User < ActiveRecord::Base
  has_many :trips
  belongs_to :trip
  has_secure_password
end
