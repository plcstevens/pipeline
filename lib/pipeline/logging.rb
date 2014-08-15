# Based on: https://github.com/gocardless/hutch/blob/master/lib/hutch/logging.rb
require 'logger'
require 'time'

module Pipeline
  module Logging
    class PipelineFormatter < Logger::Formatter
      def call(severity, time, program_name, message)
        "#{time.utc.iso8601} #{Process.pid} #{severity} -- #{message}\n"
      end
    end

    def self.setup_logger(target = $stdout)
      require 'pipeline/config'
      @logger = Logger.new(target)
      @logger.level = Pipeline::Config.log_level
      @logger.formatter = PipelineFormatter.new
      @logger
    end

    def self.logger
      @logger || setup_logger
    end

    def self.logger=(logger)
      @logger = logger
    end

    def logger
      Pipeline::Logging.logger
    end
  end
end
