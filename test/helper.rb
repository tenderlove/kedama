$VERBOSE = true
require 'test/unit'

%w(../lib ../ext).each do |path|
  $LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), path)))
end

require 'ketama'

module Ketama
  class TestCase < Test::Unit::TestCase
  end
end
