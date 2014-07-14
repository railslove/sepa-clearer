# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sepa_clearer/version'

Gem::Specification.new do |spec|
  spec.name          = "sepa-clearer"
  spec.version       = SepaClearer::VERSION
  spec.authors       = ["Maximilian Schulz"]
  spec.email         = ["m.schulz@kulturfluss.de"]
  spec.summary       = %q{List of all available SEPA clearers and their supported features}
  spec.description   = %q{This gem maintains a list of all RPS SEPA clearers available via the Deutsche Bundesbank.}
  spec.homepage      = "http://opensource.railslove.com/sepa-clearer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
