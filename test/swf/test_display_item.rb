require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestDisplayItem < Kedama::TestCase
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

    def test_move_to
      assert @di.move_to(100, 100)
    end

    def test_move
      assert @di.move(100, 100)
    end

    def test_rotate_to
      assert @di.move_to(100, 100)
      assert @di.rotate_to(10.0)
    end

    def test_rotate
      assert @di.move_to(100, 100)
      assert @di.rotate(10.0)
    end

    def test_set_scale
      assert @di.move_to(100, 100)
      assert @di.scale = [2, 1.0]
    end

    def test_scale_to
      assert @di.move_to(100, 100)
      assert @di.scale_to(2, 1.0)
    end

    # void SWFDisplayItem_skewX(SWFDisplayItem item, double x);
    def test_skew_x
      assert @di.move_to(100, 100)
      assert @di.skew_x(2.0)
    end

    # void SWFDisplayItem_skewXTo(SWFDisplayItem item, double x);
    def test_skew_x_to
      assert @di.move_to(100, 100)
      assert @di.skew_x_to(2.0)
    end

    # void SWFDisplayItem_skewY(SWFDisplayItem item, double y);
    def test_skew_y
      assert @di.move_to(100, 100)
      assert @di.skew_y(2.0)
    end

    # void SWFDisplayItem_skewYTo(SWFDisplayItem item, double y);
    def test_skew_y_to
      assert @di.move_to(100, 100)
      assert @di.skew_y_to(2.0)
    end

    # void SWFDisplayItem_getPosition(SWFDisplayItem item, double * x, double * y);
    def test_position
      assert @di.move_to(100, 100)
      assert_equal [100.0, 100.0], @di.position
    end

    # void SWFDisplayItem_getRotation(SWFDisplayItem item, double * degrees);
    def test_rotation
      assert @di.move_to(100, 100)
      assert @di.rotate(10.0)
      assert_equal 10.0, @di.rotation
    end

    # void SWFDisplayItem_getScale(SWFDisplayItem item, double * xScale, double * yScale);
    def test_scale
      assert @di.move_to(100, 100)
      assert @di.scale = [2, 1.0]
      assert_equal [2, 1.0], @di.scale
    end

    # void SWFDisplayItem_getSkew(SWFDisplayItem item, double * xSkew, double * ySkew);
    def test_skew
      assert @di.move_to(100, 100)
      assert @di.skew_x_to(2.0)
      assert @di.skew_y_to(3.0)
      assert_equal [2.0, 3.0], @di.skew
    end

    # SWFMatrix SWFDisplayItem_getMatrix(SWFDisplayItem item);
    def test_matrix
      assert matrix = @di.matrix
    end

    # void SWFDisplayItem_setMatrix(SWFDisplayItem i, double a, double b,
    # 			      double c, double d, double x, double y);
    def test_matrix=
      assert @di.matrix = [10, 1.2, 3.4, 5.6, 7.8, 9.1]
    end

    # int SWFDisplayItem_getDepth(SWFDisplayItem item);
    # void SWFDisplayItem_setDepth(SWFDisplayItem item, int depth);
    def test_depth
      assert @di.depth = 10
      assert_equal 10, @di.depth
    end

    # void SWFDisplayItem_remove(SWFDisplayItem item);
    def test_remove
      assert @di.remove
    end

    # void SWFDisplayItem_setName(SWFDisplayItem item, const char *name);
    def test_name=
      assert @di.name = 'aaron'
    end

    # void SWFDisplayItem_setMaskLevel(SWFDisplayItem item, int masklevel);
    def test_mask_level=
      assert @di.mask_level = 10
    end

    # void SWFDisplayItem_setRatio(SWFDisplayItem item, float ratio);
    def test_ratio=
      assert @di.ratio = 0.1
    end

    # void SWFDisplayItem_setCXform(SWFDisplayItem item, SWFCXform cXform);
    def test_cx_form
      assert @di.color_transform = ColorTransform.new(1,2,3,4,5.0,6.1,7.2,8.9)
    end

    # void SWFDisplayItem_setColorAdd(SWFDisplayItem item,
    # 				int r, int g, int b, int a);
    def test_color_add=
      assert @di.color_add = [5, 10, 20, 255]
    end

    # void SWFDisplayItem_setColorMult(SWFDisplayItem item,
    # 				 float r, float g, float b, float a);
    def test_color_mult=
      assert @di.color_mult = [5.1, 10.2, 20.4, 255.1]
    end
  end
end
