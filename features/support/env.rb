require 'date'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'faker'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'browsermob/proxy'
require 'browsermob/proxy/webdriver_listener'
require 'pry'
require 'date'

#World(Pages)
#World(Helper)

Faker::Config.locale = 'pt-BR'

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
HEADLESS = ENV['HEADLESS']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")

## register driver according with browser chosen
Capybara.register_driver :selenium do |app|
  if HEADLESS.eql?('headless')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--headless', '--disable-gpu', '--window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)

  elsif HEADLESS.eql?('no_headless')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--disable-infobars', 'window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 30
end


$dados = YAML.load_file('./features/datas/user_data.yml')
