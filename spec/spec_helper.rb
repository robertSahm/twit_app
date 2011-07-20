require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  unless defined?(Rails)
    require File.dirname(__FILE__) + "/../config/environment"
  end
  
  require 'rspec/rails'
  
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{|f| require f}  
  
  RSpec.configure do |config|
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
#    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
    
    config.include(MailerMacros)
    config.before(:each) { reset_email }
        
    ActiveSupport::Dependencies.clear
    
    def test_sign_in(user)
      controller.sign_in(user)
    end  
    
    def intergration_sign_in(user)
      visit signin_path
      fill_in :email,         :with => user.email
      fill_in :password,      :with => user.password
      click_button
    end  
  end
end

Spork.each_run do
end
