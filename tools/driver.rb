require 'selenium/webdriver'
require 'rspec'
require 'capybara'
require 'cucumber'
require 'pry'

class Driver
  def initialize
    browser = ENV['BROWSER'].nil? ? :firefox : ENV['BROWSER'].to_sym
    $driver = Selenium::WebDriver.for browser
    $driver.manage.timeouts.implicit_wait = 10 # seconds
  end
end

Driver.new

def browser
  $driver
end

<<<<<<< HEAD
=======
def get_home_page
  max_tries = 5
  begin
    browser.get(HOME_PAGE)
  rescue
    max_tries -= 1
    retry while max_tries > 0
  end
end
>>>>>>> upstream/master
