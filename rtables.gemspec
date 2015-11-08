require_relative 'lib/rtables/version'

Gem::Specification.new do |s|
  s.name = 'rtables'
  s.version = RTables::VERSION
  s.summary = 'Ruby Tables: Generate tables fast and easy'
  s.description = 'RTables allows you to generate your own table output in the least amount of code.'
  s.authors = ['Jos Ahrens']
  s.email = 'gems@zarth.us'
  s.files = Dir['LICENSE', 'README.md', '{docs,lib}/**/*']
  s.homepage = 'https://github.com/zarthus/rtables'
  s.license = 'MIT'
end
