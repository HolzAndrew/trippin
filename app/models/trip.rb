class Trip < ActiveRecord::Base
  has_many :trip_user_lists
  has_many :users, through: :trip_user_lists
  belongs_to :user
end
