require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/.bundle/'
end

require 'pipeline'
require 'logger'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  # Set log level to the highest
  config.before(:all) do
    Pipeline::Config.log_level = Logger::FATAL
  end

  # Raise errors on any deprecation warnings.
  config.raise_errors_for_deprecations!
end
