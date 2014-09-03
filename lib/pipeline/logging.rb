# Based on: https://github.com/gocardless/hutch/blob/master/lib/hutch/logging.rb
require 'logger'
require 'time'

module Pipeline
  # Provides a customized logging module.
  module Logging
    # Pipeline logging format
    class PipelineFormatter < Logger::Formatter
      def call(severity, time, _, message)
        "#{time.utc.iso8601} #{Process.pid} #{severity} -- #{message}\n"
      end
    end

    attr_writer :logger

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

    def logger
      Pipeline::Logging.logger
    end
  end
end
