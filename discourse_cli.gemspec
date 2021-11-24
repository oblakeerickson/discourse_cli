require 'rake'

Gem::Specification.new do |s|
  s.name        = 'discourse_cli'
  s.version     = '0.6.0'
  s.date        = '2020-08-01'
  s.summary     = "A command-line power tool for Discourse."
  s.description = "A command-line tool for remotely interacting with Discourse forums"
  s.authors     = ["Blake Erickson"]
  s.email       = 'o.blakeerickson@gmail.com'
  s.files       = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a
  s.executables = ['discourse_cli']
  s.homepage    = 'https://github.com/oblakeerickson/discourse_cli'
  s.license     = 'MIT'

  s.add_dependency 'discourse_api', '~> 0.47'
  s.add_dependency 'tiny_params', '~> 0.1'
end

