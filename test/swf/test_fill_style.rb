require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFillStyle < Kedama::TestCase
    def test_from_gradient
      assert gradient = Kedama::SWF::Gradient.new
      assert style = Kedama::SWF::FillStyle.from_gradient(gradient, 0x10)
      assert style = Kedama::SWF::FillStyle.from_gradient(gradient, Kedama::SWF::FillStyle::SOLID)
    end

    def test_new
      assert gradient = Kedama::SWF::FillStyle.new(1, 2, 3, 4)
    end

    def test_pointer_id
      gradient = Kedama::SWF::FillStyle.new(1, 2, 3, 4)
      assert gradient.pointer_id
    end
  end
end
