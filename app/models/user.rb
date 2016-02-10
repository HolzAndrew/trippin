class User < ActiveRecord::Base
  has_many :trips
  belongs_to :trip
end
