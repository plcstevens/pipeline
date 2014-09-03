# Pipeline is a library that provides a common interface for implementing
# pipeline (ETL) behaviour. You can register extractors that may use
# transformations before pushing into specified loaders.
module Pipeline
  autoload :Extractor,    'pipeline/extractor'
  autoload :Transformer,  'pipeline/transformer'
  autoload :Loader,       'pipeline/loader'
  autoload :Config,       'pipeline/config'
  autoload :Logging,      'pipeline/logging'
  autoload :Version,      'pipeline/version'

  module_function
  def register_extractor(extractor)
    extractors << extractor
  end

  def extractors
    @extractors ||= []
  end

  def register_transformer(transformer)
    transformers << transformer
  end

  def transformers
    @transformers ||= []
  end

  def register_loader(loader)
    loaders << loader
  end

  def loaders
    @loaders ||= []
  end

  def logger
    Pipeline::Logging.logger
  end
end
