# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipeline/version'

Gem::Specification.new do |spec|
  spec.name          = 'pipeline'
  spec.version       = Pipeline::VERSION
  spec.authors       = ['Reevoo Developers']
  spec.email         = ['developers@reevoo.com']
  spec.homepage      = 'http://reevoo.github.io/projects/pipeline'
  spec.license       = 'MIT'
  spec.summary       = 'An agnostic extractor, transformer, and loader library'
  spec.description   = <<-DESCRIPTION
Provides a common interface for creating all three parts to the ETL flow.
DESCRIPTION

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep('bin') { |f| File.basename(f) }
  spec.test_files    = spec.files.grep('spec')
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'

  # For tests
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'rubocop', '~> 0.25'
end
