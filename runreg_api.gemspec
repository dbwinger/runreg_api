# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'runreg_api/version'

Gem::Specification.new do |s|
  s.name          = 'runreg_api'
  s.version       = RunregApi::VERSION
  s.authors       = ['dbwinger']
  s.email         = ['dbwinger@gmail.com']
  s.homepage      = 'https://github.com/dbwinger/runreg_api'
  s.licenses      = ['MIT']
  s.summary       = '[summary]'
  s.description   = '[description]'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.executables   = Dir.glob('bin/*').map { |f| File.basename(f) }

  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end