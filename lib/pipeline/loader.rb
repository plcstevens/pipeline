module Pipeline
  # Include this module in a class to register it as an loader.
  module Loader
    def self.included(base)
      base.extend(ClassMethods)
      Pipeline.register_loader(base)
    end

    # Class methods that you should use to construct your own loader.
    module ClassMethods
    end
  end
end
