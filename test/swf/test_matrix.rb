require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestMatrix < Kedama::TestCase
    def setup
      @movie = Movie.new { |movie|
        movie.background = [0, 0, 0]
        movie.dimension = [500, 450]
        @di = movie.add(Shape.new { |shape|
          shape.right_fill_style = FillStyle.from_gradient(
            Gradient.new { |gradient|
              gradient.add_entry(0, 255, 255, 255, 255)
              gradient.add_entry(1.0, 255, 255, 255, 0)
          }, FillStyle::LINEAR_GRADIENT)
          shape.line = [1, 0, 0, 0, 255]
          shape.move_pen_to(50, 50)
          shape.draw_line_to(100, 0)
          shape.draw_line_to(0, 100)
          shape.draw_line_to(-100, 0)
          shape.draw_line_to(0, -100)
        })
      }
    end

    def test_new
      assert_raises(NoMethodError) {
        Kedama::SWF::Matrix.new
      }
    end

    %w{ scale_x scale_y rotate0 rotate1 translate_x translate_y }.each do |m|
      define_method(:"test_#{m}") do
        assert @di.matrix.send(:"#{m}")
      end
    end
  end
end
