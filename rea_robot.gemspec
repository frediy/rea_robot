# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rea_robot/version'

Gem::Specification.new do |spec|
  spec.name          = "rea_robot"
  spec.version       = ReaRobot::VERSION
  spec.authors       = ["Fredrik Persen Fostvedt"]
  spec.email         = ["fpfostvedt@gmail.com"]

  spec.summary       = %q{Solution to REA's robot challenge}
  spec.description   = %q{Solution to REA's robot challenge}
  spec.homepage      = "https://github.com/theminted/rea_robot"
  spec.license       = "none"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "dontpushtorubygems.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 11.3"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "pry", "~> 0.10"
end
