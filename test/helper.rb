$VERBOSE = true
require 'test/unit'
require 'tempfile'

%w(../lib ../ext).each do |path|
  $LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), path)))
end

require 'kedama'

module Kedama
  class TestCase < Test::Unit::TestCase
    include Kedama::SWF
    unless RUBY_VERSION >= '1.9'
      undef :default_test
    end

    ASSETS = File.expand_path(File.join(File.dirname(__FILE__), 'assets'))
  end
end
