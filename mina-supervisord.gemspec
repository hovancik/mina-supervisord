# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/supervisord/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-supervisord"
  spec.version       = Mina::Supervisord::VERSION
  spec.authors       = ["Jan Hovancik"]
  spec.email         = ["conta.srdr@gmail.com"]

  spec.summary       = %q{Supervisor wrapper for mina.}
  spec.description   = %q{supervisord wrapper for mina with support for `start`, `stop`, `restart`, `status`, `signal`, `restart:or_start`, `signal:or_start`}
  spec.homepage      = "https://github.com/hovancik/mina-supervisord"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "mina", "~> 1.0.0"
end
