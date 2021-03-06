# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'trinidad/version'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'
  
  s.name              = 'trinidad'
  s.rubyforge_project = 'trinidad'
  s.version = Trinidad::VERSION
  
  s.summary     = "Simple library to run rails applications into an embedded Tomcat"
  s.description = "Trinidad allows you to run a rails or rackup applications within an embedded Apache Tomcat container"
  
  s.authors  = ["David Calavera"]
  s.email    = 'calavera@apache.org'
  s.homepage = 'http://github.com/trinidad/trinidad'
  
  s.require_paths = %w[lib]
  s.executables = ["trinidad"]
  s.default_executable = 'trinidad'
  
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]
  
  s.add_dependency('trinidad_jars', ">= 1.0.2")
  s.add_dependency('jruby-rack', ">= 1.1.5")
  
  s.add_development_dependency('rack')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.7')
  s.add_development_dependency('mocha')
  s.add_development_dependency('fakefs', '>= 0.4.0')

  s.files = `git ls-files`.split("\n").sort.
    reject { |file| file =~ /^\./ }. # .gitignore, .travis.yml
    # TODO backward compatibility - include no spec files ?!
    reject { |file| file =~ /^spec\// }.
    # reject trinidad_jars.gemspec files :
    reject { |file| file == 'trinidad_jars.gemspec' || 
                    file == 'lib/trinidad/jars.rb'  || 
                    file =~ /^trinidad-libs\// }
  
  s.test_files = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
  
end