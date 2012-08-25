$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'version'

Gem::Specification.new do |s|
  s.name        = 'discipline'
  s.version     = Discipline::VERSION
  s.summary     = "Tool to help you stop procrastinating."
  s.description = "Discipline is a tool to help you stop procrastinating by blocking distracting online content like Facebook, Twitter and other websites."
  s.authors     = ['Tomislav Car']
  s.email       = ['tomislav@infinum.hr']
  s.homepage    = 'http://github.com/carr/discipline'
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }  
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")  
end