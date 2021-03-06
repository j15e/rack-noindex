# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'rack/noindex/version'

Gem::Specification.new do |s|
  s.name          = "rack-noindex"
  s.version       = Rack::Noindex::VERSION
  s.authors       = ["Jean-Philippe Doyle"]
  s.email         = ["jeanphilippe.doyle@gmail.com"]
  s.homepage      = "https://github.com/j15e/rack-noindex"
  s.summary       = "Rack middleware to add noindex on a given condition."
  s.description   = "Add a X-Robots-Tag: noindex header on a given condition."

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
  s.require_paths = ['lib']
  s.licenses      = ['MIT']
  s.add_dependency 'rack'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rack-test', '< 0.7'
  s.add_development_dependency 'contest'
  s.add_development_dependency 'test-unit'
end
