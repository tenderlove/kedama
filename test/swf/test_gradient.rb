require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestGradient < Kedama::TestCase
    def test_new
      assert Kedama::SWF::Gradient.new
    end

    def test_entry
      assert gradient = Kedama::SWF::Gradient.new
      assert gradient.add_entry(
        :ratio  => 1,
        :r      => 255,
        :g      => 255,
        :b      => 255,
        :a      => 255
      )
      assert gradient.add_entry(1, 255, 255, 255, 255)
    end

    def test_spread_mode=
      assert gradient = Kedama::SWF::Gradient.new
      assert gradient.spread_mode = :pad
      assert gradient.spread_mode = 0
      assert gradient.spread_mode = Kedama::SWF::Gradient::REFLECT
    end

    def test_interpolation_mode=
      assert gradient = Kedama::SWF::Gradient.new
      assert gradient.interpolation_mode = :normal
      assert gradient.interpolation_mode = 0
      assert gradient.interpolation_mode = Kedama::SWF::Gradient::LINEAR
    end

    def test_focal_point=
      assert gradient = Kedama::SWF::Gradient.new
      assert gradient.focal_point = 100.1
    end
  end
end
