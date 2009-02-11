require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestBlur < Kedama::TestCase
    def test_new
      assert blur = Blur.new(5, 5, 2)
    end
  end
end
