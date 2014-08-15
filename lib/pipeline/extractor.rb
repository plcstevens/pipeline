module Pipeline
  # Include this module in a class to register it as an extractor.
  #
  # A connection is expected to contain a method called `exec` that can receive
  # a `command` parameter and yield a result.
  #
  # A command is expected to be a query of some form that can be run on the `connection`.
  module Extractor
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_extractor(base)
    end

    module ClassMethods
      def connection(connection)
        @connection = connection
      end

      def command(command)
        @command = command
      end
    end
  end
end
