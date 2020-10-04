# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_accept/version'

Gem::Specification.new do |spec|
  spec.name          = "get_accept"
  spec.version       = GetAccept::VERSION
  spec.authors       = ["Dave Nelson"]
  spec.email         = ["davidicus21@gmail.com"]

  spec.summary       = %q{Wrapper for GetAccept API: https://www.getaccept.com}
  spec.description   = %q{Request and response details can be found in the GetAccept API documentation at https://app.getaccept.com/api}
  spec.homepage      = 'https://github.com/CrowdEngine/get_accept'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'faker'

  spec.add_dependency 'http'
end
