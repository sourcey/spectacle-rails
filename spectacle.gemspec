# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spectacle/version'

Gem::Specification.new do |spec|
  spec.name          = "spectacle"
  spec.version       = Spectacle::VERSION
  spec.authors       = ["Kam Low"]
  spec.email         = ["hello@sourcey.com"]
  spec.description   = %q{Generate beautiful static API documentation from OpenAPI/Swagger specifications in your Rails app}
  spec.summary       = %q{Rails integration for spectacle-docs - generates static HTML API docs from OpenAPI specs}
  spec.homepage      = "https://github.com/sourcey/spectacle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake", ">= 12"
  spec.add_development_dependency "rspec", "~> 3"

  spec.add_runtime_dependency "rails", ">= 6.0"
  spec.add_runtime_dependency "activesupport", ">= 6.0"
end
