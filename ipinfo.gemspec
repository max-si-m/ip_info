# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ipinfo/version'

Gem::Specification.new do |spec|
  spec.name          = "ipinfo"
  spec.version       = IpInfo::VERSION
  spec.authors       = ["Maxim Djuliy"]
  spec.email         = ["mak7.dj@gmail.com"]
  spec.description   = %q{API interface for http://ipinfodb.com }
  spec.summary       = "Using for getting information about ip"
  spec.homepage      = "https://github.com/max-si-m/ipinfodb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.5"
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'vcr', '~> 2.9', '>= 2.9.3'
  spec.add_development_dependency 'webmock', '~>1.21'
  spec.add_development_dependency 'dotenv', '~>2.0'
end
