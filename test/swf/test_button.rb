require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestButton < Kedama::TestCase
    def test_new_yields
      called = false
      Button.new { |button|
        assert button
        called = true
      }
      assert called
    end

    def test_button
      Movie.new { |movie|
        di = nil
        shape = Shape.new { |s|
          s.line = [2, 255, 0, 0, 255]
          s.right_fill = s.solid_fill(255, 0, 0, 255)
          s.draw_circle(20)
        }

        movie.frame { |frame|
          di = frame << Button.new { |button|
            button.add_character(shape,
                       Button::HIT|Button::UP|Button::DOWN|Button::OVER)
            button.add_action(Action.new('_root.gotoAndStop(2);'),Button::MOUSEUP)
          }
          frame << Action.new('_root.stop();')
          di.move_to(100, 100)
        }

        movie.frame { |frame|
          di.remove
          di = frame << Button.new { |button|
            button.add_character(shape,
                       Button::HIT|Button::UP|Button::DOWN|Button::OVER)
            button.add_action(Action.new('_root.gotoAndStop(1);'),Button::MOUSEDOWN)
          }
          di.move_to(50, 100)
        }
      }
    end

    def test_rotate_and_move
      Movie.new { |movie|
        shape = Shape.new { |s|
          s.line = [1, 255, 0, 0, 255]
          s.right_fill = s.solid_fill(255, 255, 0, 255)
          s.draw_line(100, 0)
          s.draw_line(0, 40)
          s.draw_line(0, 0)
        }
      }
    end
  end
end
