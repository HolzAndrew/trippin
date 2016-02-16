include ActionView::Helpers::SanitizeHelper
class Location < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  before_save :sanitize_html

  protected
  def sanitize_html
    sanitized_output = sanitize("<script></script>")
  end
end
