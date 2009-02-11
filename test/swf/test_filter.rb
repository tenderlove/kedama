require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFilter < Kedama::TestCase
    def test_from_blur
      assert Filter.from_blur(Blur.new(1.2, 2.2, 2))
    end
  end
end
