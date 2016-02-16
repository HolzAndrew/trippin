include ActionView::Helpers::SanitizeHelper
class Invitation < ActiveRecord::Base
  belongs_to :trip
  before_save :sanitize_html

  protected
  def sanitize_html
    sanitized_output = sanitize('<script></script>')
  end
end
