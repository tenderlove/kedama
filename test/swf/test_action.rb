require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestAction < Kedama::TestCase
    def test_new
      called = false
      action = Action.new("trace('');") { |a|
        assert a
        called = true
      }
      assert called
    end
  end
end
