class Trip < ActiveRecord::Base

  has_many :trip_user_lists
  has_and_belongs_to_many :users

  belongs_to :user
  has_many :trip_user_lists

end
