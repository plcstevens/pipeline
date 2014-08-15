module Pipeline
  module Extractor
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_extractor(base)
    end

    module ClassMethods
    end
  end
end
