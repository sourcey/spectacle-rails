# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spectacle/version'

Gem::Specification.new do |spec|
  spec.name          = "spectacle"
  spec.version       = Spectacle::VERSION
  spec.authors       = ["Kam Low"]
  spec.email         = ["auscaster@sourcey.com"]
  spec.description   = %q{Generates beautiful static documentation from a OpenAPI/Swagger 2.0 spec for you Rails API}
  spec.summary       = %q{Generates beautiful static documentation from a OpenAPI/Swagger 2.0 spec for you Rails API}
  spec.homepage      = "https://sourcey.com/spectacle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.cert_chain  = ['certs/gem-public_cert.pem']
  spec.signing_key = File.expand_path("~/.gemcert/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "~> 3"

  spec.add_runtime_dependency "rails", ">= 3"
  spec.add_runtime_dependency "activesupport", ">= 3"
end
