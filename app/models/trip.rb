class Trip < ActiveRecord::Base
  has_many :trip_user_lists
  has_many :users
  belongs_to :user
end
