# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spectacle/version'

Gem::Specification.new do |spec|
  spec.name          = "spectacle"
  spec.version       = Spectacle::VERSION
  spec.authors       = ["Kam Low"]
  spec.email         = ["hello@sourcey.com"]
  spec.description   = %q{Generates beautiful static HTML docs from a OpenAPI/Swagger 2.0 specification}
  spec.summary       = %q{Generates beautiful static HTML docs for you Rails API from a OpenAPI/Swagger 2.0 specification}
  spec.homepage      = "https://sourcey.com/spectacle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.cert_chain  = ['certs/gem-public_cert.pem']
  # spec.signing_key = File.expand_path("~/.gemcert/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "~> 3"

  spec.add_runtime_dependency "rails", ">= 3"
  spec.add_runtime_dependency "activesupport", ">= 3"
  spec.add_runtime_dependency "compass", ">= 1.0.3"
end
