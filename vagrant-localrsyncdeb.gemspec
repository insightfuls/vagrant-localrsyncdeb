# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-localrsyncdeb/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-localrsyncdeb"
  spec.version       = VagrantPlugins::LocalRsyncDeb::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.license       = "MIT"
  spec.authors       = ["Ben Schmidt"]
  spec.email         = ["<insightful_schmidt@yahoo.com.au>"]
  spec.summary       = "Uses a local rsync.deb file instead of apt-get to install rsync on Debian"
  spec.description   = "Uses a local rsync.deb file instead of apt-get to install rsync on Debian"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
