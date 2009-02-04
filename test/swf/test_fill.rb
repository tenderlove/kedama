require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFill < Kedama::TestCase
    def setup
      assert gradient = Kedama::SWF::Gradient.new
      assert @style = Kedama::SWF::FillStyle.from_gradient(gradient, 0x10)
    end

    def test_new
      called = false
      Kedama::SWF::Fill.new(@style) { |fill|
        assert fill
        called = true
      }
      assert called
    end

    def test_move
      assert Kedama::SWF::Fill.new(@style).move(50, 50)
    end

    def test_move_to
      assert Kedama::SWF::Fill.new(@style).move_to(50, 50)
    end
  end
end
