require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestShape < Kedama::TestCase
    def test_new
      assert Kedama::SWF::Shape.new
    end

    def test_version
      shape = Kedama::SWF::Shape.new
      assert shape.version = 3
    end

    def test_add_to_movie
      assert movie = Kedama::SWF::Movie.new
      movie.frame do |frame|
        shape = Kedama::SWF::Shape.new
        shape.version = 4
        frame << shape
      end
    end

    def test_solid_fill
      shape = Kedama::SWF::Shape.new
      assert fill = shape.solid_fill(255, 0, 0, 255)
      assert shape.right_fill = fill
    end

    def test_move_pen_to
      shape = Kedama::SWF::Shape.new
      assert shape.move_pen_to(167.000000, 69.875040)
      assert_in_delta 167.0, shape.pen_x, 0.1
      assert_in_delta 69.875040, shape.pen_y, 0.03
    end

    def test_pen
      shape = Kedama::SWF::Shape.new
      assert shape.move_pen_to(167.000000, 69.875040)
      assert_in_delta 167.0, shape.pen[0], 0.1
      assert_in_delta 69.875040, shape.pen[1], 0.03
    end

    def test_draw_circle
      shape = Kedama::SWF::Shape.new
      shape.line = [2, 255, 0, 0, 255]
      shape.draw_circle(20)
    end

    def test_draw_cubic_to
      shape = Kedama::SWF::Shape.new
      assert shape.move_pen_to(167.000000, 69.875040)
      segments = shape.draw_cubic_to(
        198.796531,
        69.875040,
        224.624960,
        95.703469,
        224.624960,
        127.500000
      )
      assert_instance_of Fixnum, segments
    end

    def test_move_pen
      shape = Kedama::SWF::Shape.new
      assert shape.move_pen(167.000000, 69.875040)
      assert_in_delta 167.0, shape.pen[0], 0.1
      assert_in_delta 69.875040, shape.pen[1], 0.03
    end

    def test_line=
      shape = Kedama::SWF::Shape.new
      shape.line = {
        :width  => 10,
        :r      => 25,
        :g      => 0,
        :b      => 0,
        :a      => 128
      }
      shape.line = [10, 25, 0, 0, 128]
    end

    def test_new_takes_block
      called = false
      Kedama::SWF::Shape.new { |shape|
        assert shape
        called = true
      }
      assert called
    end
  end
end
