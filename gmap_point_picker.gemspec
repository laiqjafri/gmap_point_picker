# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmap_point_picker/version'

Gem::Specification.new do |spec|
  spec.name          = "gmap_point_picker"
  spec.version       = GmapPointPicker::VERSION
  spec.authors       = ["Laiq Jafri"]
  spec.email         = ["laiq.jafri@gmail.com"]

  spec.summary       = %q{A gem to easily pick co-ordinates from google map and map them to input fields}
  spec.description   = %q{A gem to easily pick co-ordinates from google map and map them to input fields (latitude and longitude)}
  spec.homepage      = "https://github.com/laiqjafri/gmap_point_picker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
