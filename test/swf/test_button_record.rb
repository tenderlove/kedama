require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestButtonRecord < Kedama::TestCase
    def setup
      @br = nil
      shape = Shape.new { |s|
        s.line = [2, 255, 0, 0, 255]
        s.right_fill = s.solid_fill(255, 0, 0, 255)
        s.draw_circle(20)
      }
      Button.new { |button|
        @br = button.add_character(shape, Button::OVER)
        button.add_action(Action.new('_root.gotoAndStop(2);'),Button::MOUSEUP)
      }
    end

    #void SWFButtonRecord_setDepth(SWFButtonRecord b, int depth);
    def test_depth=
      @br.depth = 100
    end

    #void SWFButtonRecord_addFilter(SWFButtonRecord b, SWFFilter f);
    def test_add_filter
      flunk
    end

    #void SWFButtonRecord_setBlendMode(SWFButtonRecord b, int mode);
    def test_blend_mode=
      assert @br.blend_mode = :diff
      assert @br.blend_mode = 10
    end

    #void SWFButtonRecord_move(SWFButtonRecord record, double x, double y);
    #void SWFButtonRecord_moveTo(SWFButtonRecord record, double x, double y);
    #void SWFButtonRecord_scale(SWFButtonRecord record, double scaleX, double scaleY);
    #void SWFButtonRecord_scaleTo(SWFButtonRecord record, double scaleX, double scaleY);
    %w{ move move_to scale scale_to }.each do |alt|
      define_method(:"test_#{alt}") do
        assert @br.send(:"#{alt}", 2.2, 3.3)
      end
    end

    #void SWFButtonRecord_rotate(SWFButtonRecord record, double deg);
    #void SWFButtonRecord_rotateTo(SWFButtonRecord record, double deg);
    #void SWFButtonRecord_skewX(SWFButtonRecord record, double skewX);
    #void SWFButtonRecord_skewXTo(SWFButtonRecord record, double skewX);
    #void SWFButtonRecord_skewY(SWFButtonRecord record, double skewY);
    #void SWFButtonRecord_skewYTo(SWFButtonRecord record, double skewY);
    %w{ rotate rotate_to skew_x skew_x_to skew_y skew_y_to }.each do |alt|
      define_method(:"test_#{alt}") do
        assert @br.send(:"#{alt}", 2.2)
      end
    end
  end
end
