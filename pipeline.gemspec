# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipeline/version'

Gem::Specification.new do |spec|
  spec.name          = "pipeline"
  spec.version       = Pipeline::VERSION
  spec.authors       = ["Philip Stevens"]
  spec.email         = ["philip.stevens@reevoo.com"]
  spec.summary       = %q{An agnostic extractor, transformer, and loader library}
  spec.description   = %q{Provides a common interface for creating all three parts to the ETL flow.}
  spec.homepage      = "http://reevoo.github.io/projects/pipeline"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'multi_json', '~> 1.10'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'

  # For tests
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'rubocop', '~> 0.25'
end
