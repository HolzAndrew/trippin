class Trip < ActiveRecord::Base

  belongs_to :user
  has_many :trip_user_lists
  has_many :comments
end
