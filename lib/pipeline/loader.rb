module Pipeline
  module Loader
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_loader(base)
    end

    module ClassMethods
    end
  end
end
