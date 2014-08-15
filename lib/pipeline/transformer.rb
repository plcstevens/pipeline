module Pipeline
  # Include this module in a class to register it as an transformer.
  # Transformers are ordered by the loading order, or as specified by
  # setting the position value to a non-negative integer; where 1 has the
  # highest priority
  module Transformer
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_transformer(base)
    end

    module ClassMethods
      def position(value)
        value = value.to_i
        if value > 0
          @position = value
        end
      end
    end
  end
end
