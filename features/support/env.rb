require 'selenium-webdriver'
require 'rspec'
require 'pry'

require_relative '../page_model/page_actions.rb'

SERVER_LABELS = {
    :qa1 => "integration.usps.com",
    :qa2 => "release.usps.com",
    :production => "usps.com"
}

def get_env
  env = (ENV['SERVER'] || :production)
  SERVER_LABELS[env.to_sym]
end



# load all .rb files before...
Dir["../page_model/*.rb"].each {|file| require file}

DEFAULT_TIMEOUT = 10

def get_browser
  env = (ENV['BROWSER'] || :firefox)
  env.to_sym
end


def create_browser
  @browser = Selenium::WebDriver.for get_browser
  @browser.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT #for waiting an elements on the needed page
end

def usps
  @usps ||= USPS.new @browser
end