class User < ActiveRecord::Base
	
  has_secure_password

  has_many :trips
  belongs_to :trip
end
