lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kubo/version"

Gem::Specification.new do |spec|
  spec.name          = "kubo"
  spec.version       = Kubo::VERSION
  spec.authors       = ["Cecille Manalang"]
  spec.email         = ["cecille@bloom.solutions"]

  spec.summary       = %q{Opinionated tools for Kubernetes deployment and management}
  spec.homepage      = "https://github.com/bloom-solutions/kubo"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "bin"
  spec.executables   = "kubo"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "thor", "~> 1.0"
  spec.add_runtime_dependency "krane", "~> 2.1"
  spec.add_runtime_dependency "activesupport", "~> 6.0"
end
