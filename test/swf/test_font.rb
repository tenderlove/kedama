require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFont < Kedama::TestCase
    def test_load_from_file
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
    end

    def test_ascent
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert font.ascent
    end

    def test_descent
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert font.descent
    end

    def test_leading
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert font.leading
    end

    def test_name
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert_equal 'Bitstream Vera Sans', font.name
    end

    def test_glyph_count
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert_equal 227, font.glyph_count
    end

    def test_string_width
      assert font = Kedama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
      assert_in_delta 123.65, font.width_of('hello'), 0.01
    end
  end
end
