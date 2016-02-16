include ActionView::Helpers::SanitizeHelper
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  before_save :sanitize_html

  protected
  def sanitize_html
    sanitized_output = sanitize("<script></script>")
  end
end
