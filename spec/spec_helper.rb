require 'simplecov'
SimpleCov.start { add_filter '/spec/' }

require 'pry'
require 'pipeline'
require 'logger'

Dir['./spec/support/**/*.rb'].each { |f| require f }
RSpec.configure do |config|
  config.before(:all) { Pipeline::Config.log_level = Logger::FATAL }
  config.raise_errors_for_deprecations!
end
