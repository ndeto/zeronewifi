# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

=begin
ActionMailer::Base.smtp_settings = {
  :user_name => 'mndeto',
  :password => 'mart7592',
  :domain => 'herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
=end

# Initialize the Rails application.
Rails.application.initialize!
