# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/ketama/version.rb'

kind = Config::CONFIG['DLEXT']

HOE = Hoe.new('ketama', Ketama::VERSION) do |p|
  p.rubyforge_name = 'ketama'
  p.developer('Aaron Patterson', 'aaronp@rubyforge.org')
  p.clean_globs = [
    'ext/ketama/Makefile',
    'ext/ketama/*.{o,so,bundle,a,log,dll}',
    'ext/ketama/conftest.dSYM',
  ]
  p.spec_extras = { :extensions => ["ext/ketama/extconf.rb"] }
end

EXT = "ext/ketama/ketama.#{kind}"
task 'ext/ketama/Makefile' do
  Dir.chdir('ext/ketama') do
    ruby "extconf.rb"
  end
end

task EXT => 'ext/ketama/Makefile' do
  Dir.chdir('ext/ketama') do
    sh 'make'
  end
end

task :build => [EXT]

Rake::Task[:test].prerequisites << :build

# vim: syntax=Ruby
