require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestColorTransform < Kedama::TestCase
    def setup
      @cx = ColorTransform.new(1,2,3,4,5.0,6.1,7.2,8.9)
    end

    def test_new
      assert cx = ColorTransform.new(1,2,3,4,5.0,6.1,7.2,8.9)
    end

    def test_add
      assert cx = ColorTransform.add(1,2,3,4)
    end

    def test_multiply
      assert cx = ColorTransform.multiply(1.1,2.2,3.3,4.4)
    end

    def test_multiply=
      assert @cx.multiply = [1.1, 2.2, 3.3, 4.4]
    end

    def test_add=
      assert @cx.add = [1, 2, 3, 4]
    end
  end
end
