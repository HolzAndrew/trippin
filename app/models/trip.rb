include ActionView::Helpers::SanitizeHelper
class Trip < ActiveRecord::Base

  has_many :trip_user_lists
  has_many :users
  belongs_to :user
  has_many :trip_user_lists
  has_many :comments

  before_save :sanitize_html

  protected
  def sanitize_html
    sanitized_output = sanitize("<script></script>")
  end
end
