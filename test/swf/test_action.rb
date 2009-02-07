require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestAction < Kedama::TestCase
    def setup
      @action = Action.new("trace('');")
    end

    def test_new
      called = false
      action = Action.new("trace('');") { |a|
        assert a
        called = true
      }
      assert called
    end
    
    def test_compile
      assert_equal 13, @action.compile(7)
    end

    def test_byte_code
      assert @action.compile(7)
      assert @action.byte_code
    end

    def test_debug=
      assert @action.debug = true
    end

    def test_init
      assert @action.init
    end

    def test_add_to_movie
      Movie.new { |movie|
        movie << @action.init
      }
    end
  end
end
