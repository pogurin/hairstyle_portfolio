# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

	config.action_mailer.delivery_method = :sendmail
  	config.action_mailer.raise_delivery_errors = true
  	config.action_mailer.default_options = {from: 'seiun340066@gmail.com'}
  	
  ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :authentication => :plain,
    :user_name => 'app33275578@heroku.com',
    :password => 'qxrasadi'
  }