# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :domain => 'heroku.com',
  :api_key => ENV['SENDGRID_API_KEY'],
  :enable_startstls_auto => true
}