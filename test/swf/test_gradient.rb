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

    def test_add_entry_add_to_movie
      assert movie = Kedama::SWF::Movie.new
      assert gradient = Kedama::SWF::Gradient.new

      gradient.add_entry(0, 0, 0, 0, 255)
      gradient.add_entry(1, 255, 255, 255, 255)

      assert fill = Kedama::SWF::FillStyle.from_gradient(gradient, 0x10)
      assert shape = Kedama::SWF::Shape.new
      shape.right_fill_style = fill

      shape.line = {
        :width => 1,
        :r      => 0,
        :g      => 0,
        :b      => 0,
        :a      => 255
      }
      shape.draw_line_to(100, 0)
      shape.draw_line_to(0, 100)
      shape.draw_line_to(-100, 0)
      shape.draw_line_to(0, -100)

      movie.frame { |frame| frame << shape }
    end

    def test_new_takes_block
      called = false
      Gradient.new { |gradient| called = true }
      assert called
    end

    def test_add_entry_add_to_movie_2
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0,   0,    0,  0,  255)
                gradient.add_entry(0.2, 0,    10, 0,  255)
                gradient.add_entry(0.3, 110,  0,  10, 255)
                gradient.add_entry(0.4, 20,   0,  0,  255)
                gradient.add_entry(0.5, 0,    20, 0,  255)
                gradient.add_entry(0.6, 0,    0,  20, 255)
                gradient.add_entry(0.7, 30,   0,  100,255)
            }, 0x10)
            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }#.save('test02.swf')
    end

    def test_add_entry_add_to_movie_up_to_zero_point_nine
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0,   0,    0,  0,  255)
                gradient.add_entry(0.2, 0,    10, 0,  255)
                gradient.add_entry(0.3, 110,  0,  10, 255)
                gradient.add_entry(0.4, 20,   0,  0,  255)
                gradient.add_entry(0.5, 0,    20, 0,  255)
                gradient.add_entry(0.6, 0,    0,  20, 255)
                gradient.add_entry(0.7, 30,   0,  0,  255)

                gradient.add_entry(0.8, 0,    30, 0,  255)
                gradient.add_entry(0.9, 0,    0,  30, 255)
            }, 0x10)
            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end

    def test_add_entry_add_to_movie_up_to_zero_point_nine_use_version
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.version = 4
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0,   0,    0,  0,  255)
                gradient.add_entry(0.2, 0,    10, 0,  255)
                gradient.add_entry(0.3, 110,  0,  10, 255)
                gradient.add_entry(0.4, 20,   0,  0,  255)
                gradient.add_entry(0.5, 0,    20, 0,  255)
                gradient.add_entry(0.6, 0,    0,  20, 255)
                gradient.add_entry(0.7, 30,   0,  0,  255)

                gradient.add_entry(0.8, 0,    30, 0,  255)
                gradient.add_entry(0.9, 0,    0,  30, 255)
            }, 0x10)
            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end

    def test_add_entry_add_to_movie_set_spread_mode_and_interp_mode
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.version = 4
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.spread_mode = :repeat
                gradient.interpolation_mode = :linear
                gradient.add_entry(0,   0,    0,  0,  255)
                gradient.add_entry(0.2, 0,    10, 0,  255)
                gradient.add_entry(0.3, 110,  0,  10, 255)
                gradient.add_entry(0.4, 20,   0,  0,  255)
                gradient.add_entry(0.5, 0,    20, 0,  255)
                gradient.add_entry(0.6, 0,    0,  20, 255)
                gradient.add_entry(0.7, 30,   0,  0,  255)

                gradient.add_entry(0.8, 0,    30, 0,  255)
                gradient.add_entry(0.9, 0,    0,  30, 255)
            }, 0x10)
            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end

    def test_add_entry_add_to_movie_set_focal_point
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.version = 4
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.spread_mode = :repeat
                gradient.interpolation_mode = :linear
                gradient.focal_point = 0.2
                gradient.add_entry(0,   0,    0,  0,  255)
                gradient.add_entry(0.2, 0,    10, 0,  255)
                gradient.add_entry(0.3, 110,  0,  10, 255)
                gradient.add_entry(0.4, 20,   0,  0,  255)
                gradient.add_entry(0.5, 0,    20, 0,  255)
                gradient.add_entry(0.6, 0,    0,  20, 255)
                gradient.add_entry(0.7, 30,   0,  0,  255)

                gradient.add_entry(0.8, 0,    30, 0,  255)
                gradient.add_entry(0.9, 0,    0,  30, 255)
            }, 0x10)
            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end

    def test_gradient_fill_circle
      Movie.new { |movie|
        movie.background = [0, 0, 0]
        movie.dimension = [500, 450]
        movie.frame { |frame|
          di = frame << Shape.new { |shape|
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0, 255, 255, 255, 255)
                gradient.add_entry(1.0, 255, 255, 255, 0)
            }, FillStyle::RADIAL_GRADIENT)
            shape.draw_circle(55)
          }
          di.move_to(100, 100)
        }
      }
    end

    def test_gradient_set_line_move_pen
      Movie.new { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            shape.right_fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0, 255, 0, 0, 255)
                gradient.add_entry(1, 255, 255, 255, 0)
            }, FillStyle::LINEAR_GRADIENT)
            shape.line = [1, 0, 0, 0, 255]
            shape.move_pen_to(50, 50)
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end

    def test_gradient_set_line_move_pen_version_8
      Movie.new(8) { |movie|
        movie.frame { |frame|
          frame << Shape.new { |shape|
            fill_style = FillStyle.from_gradient(
              Gradient.new { |gradient|
                gradient.add_entry(0, 0, 0, 0, 255)
                gradient.add_entry(1, 255, 255, 255, 255)
            }, FillStyle::LINEAR_GRADIENT)

            shape.right_fill_style = fill_style

            Fill.new(fill_style) { |fill|
              fill.move(50, 50)
            }

            shape.line = [1, 0, 0, 0, 255]
            shape.draw_line_to(100, 0)
            shape.draw_line_to(0, 100)
            shape.draw_line_to(-100, 0)
            shape.draw_line_to(0, -100)
          }
        }
      }
    end
  end
end
