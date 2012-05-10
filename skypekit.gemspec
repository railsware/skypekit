# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Andriy Yanko"]
  gem.email         = ["andriy.yanko@gmail.com"]
  gem.description   = %q{Ruby FFI interface to libskypekit C library}
  gem.summary       = %q{Ruby FFI interface to libskypekit C library}
  gem.homepage      = "https://github.com/railsware/skypekit"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "skypekit"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_runtime_dependency "ffi", ">=1.0.0"
end
