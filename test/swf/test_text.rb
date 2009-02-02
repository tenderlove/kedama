require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestText < Kedama::TestCase
    def test_new
      assert Kedama::SWF::Text.new
    end

    def test_new_with_text
      font = Kedama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
      text = Kedama::SWF::Text.new(font, "hello world")
    end

    def test_new_with_path
      text = Kedama::SWF::Text.new(
        File.join(ASSETS, 'font01.fdb'),
        "hello world"
      )
    end

    def test_set_height
      assert font = Kedama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
      assert text = Kedama::SWF::Text.new(font, "hello world")
      assert text.height = 20
    end

    def test_set_color
      assert font = Kedama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
      assert text = Kedama::SWF::Text.new(font, "hello world")
      assert text.color = [0, 0, 0, 0xff]
    end

    def test_move_to
      assert text = Kedama::SWF::Text.new()
      assert text.font = File.join(ASSETS, 'font01.fdb')
      assert text.move_to(10, 10)
      text << "hello world"
    end

    def test_set_spacing
      assert text = Kedama::SWF::Text.new()
      assert text.font = File.join(ASSETS, 'font01.fdb')
      assert text.spacing = 10
    end

    def test_string_width
      assert text = Kedama::SWF::Text.new()
      assert text.font = File.join(ASSETS, 'test.ttf')
      assert_in_delta 18.85, text.width_of("foo"), 0.0001
    end
  end
end
