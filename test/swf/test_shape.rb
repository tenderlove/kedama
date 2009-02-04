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

    def test_move_pen
      shape = Kedama::SWF::Shape.new
      assert shape.move_pen_to(167.000000, 69.875040)
      assert_in_delta 167.0, shape.pen_x, 0.1
      assert_in_delta 69.875040, shape.pen_y, 0.03
    end
  end
end
