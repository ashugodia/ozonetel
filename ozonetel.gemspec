# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ozonetel/version'

Gem::Specification.new do |spec|
  spec.name          = "ozonetel"
  spec.version       = Ozonetel::VERSION
  spec.authors       = ["Aashutosh Chaudhary"]
  spec.email         = ["ashugodia@gmail.com"]

  spec.summary       = %q{REST API to interact with Ozonetel KooKoo.}
  spec.description   = %q{This gem helps to make outbound calls using KooKoo.}
  spec.homepage      = "https://github.com/ashugodia/ozonetel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'httparty', "~> 0.14.0"
end
