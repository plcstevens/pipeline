module Pipeline
  # Include this module in a class to register it as an extractor.
  module Extractor
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_extractor(base)
    end

    # Class methods that you should use to construct your own extractor.
    module ClassMethods
      attr_writer :connection, :command, :transformations
    end
  end
end
