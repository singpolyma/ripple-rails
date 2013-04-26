# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "ripple-rails"
  gem.version       = '0.2.0'
  gem.authors       = ["singpolyma"]
  gem.email         = ["singpolyma@singpolyma.net"]
  gem.description   = %q{Rails integration for Ripple payment notifications.}
  gem.summary       = %q{Rails integration for Ripple payment notifications.}
  gem.homepage      = "https://github.com/singpolyma/ripple-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faye-websocket', '~> 0.4'
  gem.add_dependency 'rippler', '>= 0.0.11'
end
