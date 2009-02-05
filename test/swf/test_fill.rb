require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFill < Kedama::TestCase
    def setup
      assert gradient = Kedama::SWF::Gradient.new
      assert @style = Kedama::SWF::FillStyle.from_gradient(gradient, 0x10)
      assert @fill = Kedama::SWF::Fill.new(@style)
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

    def test_get_fill_style
      assert fill = Kedama::SWF::Fill.new(@style)
      assert_equal @style, fill.fill_style
    end

    def test_scalexy
      assert fill = Kedama::SWF::Fill.new(@style)
      assert fill.scale_xy(10, 5.4)
    end

    def test_scalexy_to
      assert fill = Kedama::SWF::Fill.new(@style)
      assert fill.scale_xy_to(10, 5.4)
    end

    %w{ skew scale }.each do |verb|
      %w{ x y }.each do |direction|
        define_method(:"test_#{verb}_#{direction}") do
          assert @fill.send(:"#{verb}_#{direction}", 5.4)
        end

        define_method(:"test_#{verb}_#{direction}_to") do
          assert @fill.send(:"#{verb}_#{direction}_to", 5.4)
        end
      end
    end
  end
end
