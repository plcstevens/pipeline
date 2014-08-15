module Pipeline
  module Transformer
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_transformer(base)
    end

    module ClassMethods
    end
  end
end
