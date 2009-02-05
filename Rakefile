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

rule '.c' => '.c.erb' do |t|
  require 'erb'

  c_name = File.basename(t.name, '.c').gsub(/_[a-z]/) { |x|
    x.gsub(/_/,'').upcase
  }.sub(/^swf/, 'SWF')

  ming_h = '/opt/local/include/ming.h'

  ruby_methods = {}
  File.read(ming_h).scan(/void\s*(#{c_name}[^\(]*)\(([^;]*);/).each do |sig|
    c_function = sig[0]
    parameters = sig[1].split(',').map { |part|
      part.strip.sub(/\)$/, '').split(/\s+/)
    }
    ruby_name = c_function.split('_').last.
      gsub(/XY/, '_xy'). # XY is special
      gsub(/([A-Z])/, '_\1').
      downcase.sub(/^set_/, '')
    ruby_methods[ruby_name] = Struct.new(:name, :params).new(
      c_function, parameters[1..-1]
    )
  end

  template = ERB.new(File.read(t.source))
  File.open(t.name, 'wb') { |f|
    f.write template.result(binding)
  }
  puts "#{t.source} #{t.name}"
end

task :build => ['ext/kedama/swf_fill.c', EXT]

Rake::Task[:test].prerequisites << :build

# vim: syntax=Ruby
