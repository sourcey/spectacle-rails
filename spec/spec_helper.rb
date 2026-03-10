require 'rails'
require 'spectacle'
require 'ostruct'
require 'json'
require 'pathname'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color = true

  config.before(:each) do
    Spectacle::Config.reset!
    Spectacle::Config.spec_file = File.join(File.dirname(__FILE__), 'fixtures/tommy.json')
  end
end
