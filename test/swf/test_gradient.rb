require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestGradient < Kedama::TestCase
    def test_new
      assert Kedama::SWF::Gradient.new
    end

    def test_entry
      assert gradient = Kedama::SWF::Gradient.new
      gradient.add_entry(
        :ratio  => 1,
        :r      => 255,
        :g      => 255,
        :b      => 255,
        :a      => 255
      )
      gradient.add_entry(1, 255, 255, 255, 255)
    end
  end
end
