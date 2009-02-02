# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/kedama/version.rb'

kind = Config::CONFIG['DLEXT']

HOE = Hoe.new('kedama', Kedama::VERSION) do |p|
  p.rubyforge_name = 'kedama'
  p.developer('Aaron Patterson', 'aaronp@rubyforge.org')
  p.clean_globs = [
    'ext/kedama/Makefile',
    'ext/kedama/*.{o,so,bundle,a,log,dll}',
    'ext/kedama/conftest.dSYM',
  ]
  p.spec_extras = { :extensions => ["ext/kedama/extconf.rb"] }
end

EXT = "ext/kedama/kedama.#{kind}"
task 'ext/kedama/Makefile' do
  Dir.chdir('ext/kedama') do
    ruby "extconf.rb"
  end
end

task EXT => 'ext/kedama/Makefile' do
  Dir.chdir('ext/kedama') do
    sh 'make'
  end
end

task :build => [EXT]

Rake::Task[:test].prerequisites << :build

# vim: syntax=Ruby
