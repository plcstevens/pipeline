module Pipeline
  # Include this module in a class to register it as an transformer.
  module Transformer
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_transformer(base)
    end

    # Class methods that you should use to construct your own transformer.
    module ClassMethods
      def position(value)
        value = value.to_i
        @position = value if value > 0
      end
    end
  end
end
