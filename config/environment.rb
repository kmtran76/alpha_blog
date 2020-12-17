# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# To remove the field_with_errors functionality that added by rails 
# when there is a field that hit the validation error 
# (But we want to disable this feature from rails  by insert the following code below) 
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end