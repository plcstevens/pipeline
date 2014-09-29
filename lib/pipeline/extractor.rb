module Pipeline
  # Include this module in a class to register it as an extractor.
  module Extractor
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_extractor(base)
    end

    # Class methods that you should use to construct your own extractor.
    module ClassMethods
      attr_accessor :connection, :command, :loaders

      def execute
        if block_given?
          connection[command].each do |row|
            yield row
          end
        else
          connection[command].each do |row|
            loaders.each do |loader|
              loader.process(row)
            end
          end
        end
      end
    end
  end
end
