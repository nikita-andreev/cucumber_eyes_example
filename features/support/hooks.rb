require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'eyes_selenium'
require 'applitools/capybara'


Capybara.run_server = false
Applitools.register_capybara_driver :browser => :chrome

include Capybara::DSL

Before do

end