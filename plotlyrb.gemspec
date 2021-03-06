# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plotlyrb/version'

Gem::Specification.new do |spec|
  spec.name          = "plotlyrb"
  spec.version       = Plotlyrb::VERSION
  spec.authors       = ["Veitch Lister Consulting"]
  spec.email         = ["developers@veitchlister.com.au"]

  spec.summary       = %q{A Ruby wrapper around the Plotly RESTful API.}
  spec.description   = %q{Plotly features added as needed. Uses Python Library as a reference https://github.com/plotly/plotly.py/tree/master/plotly/plotly}
  spec.homepage      = "https://github.com/vlc/plotlyrb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.8.7'

  # Only get backports and json if < Ruby 1.9.3
  spec.extensions << 'ext/mkrf_conf.rb'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
