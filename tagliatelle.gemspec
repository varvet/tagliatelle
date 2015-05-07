$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tagliatelle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tagliatelle"
  spec.version     = Tagliatelle::VERSION
  spec.authors     = ["Jens Ljungblad"]
  spec.email       = ["jens.ljungblad@gmail.com"]
  spec.homepage    = "https://github.com/varvet/tagliatelle"
  spec.summary     = "Simple tagging for Rails 4+"
  spec.description = "Simple tagging for Rails 4+"
  spec.license     = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency "rails", "~> 4.0"

  spec.add_development_dependency "sqlite3"
end
