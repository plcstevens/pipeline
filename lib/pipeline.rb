module Pipeline
  autoload :Extractor,    'pipeline/extractor'
  autoload :Transformer,  'pipeline/transformer'
  autoload :Loader,       'pipeline/loader'
  autoload :Config,       'pipeline/config'
  autoload :Logging,      'pipeline/logging'
  autoload :Version,      'pipeline/version'

  def self.register_extractor(extractor)
    self.extractors << extractor
  end

  def self.extractors
    @extractors ||= []
  end

  def self.register_transformers(transformer)
    self.transformers << transformer
  end

  def self.transformers
    @transformers ||= []
  end

  def self.register_loader(loader)
    self.loaders << loader
  end

  def self.loaders
    @loaders ||= []
  end

  def self.logger
    Pipeline::Logging.logger
  end
end
