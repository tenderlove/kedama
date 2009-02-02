require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

require 'tempfile'

module SWF
  class TestMovie < Ketama::TestCase
    @@test_number = 0

    def setup
      @@test_number += 1
    end

    def test_new
      assert Ketama::SWF::Movie.new
    end

    def test_add_text
      assert movie = Ketama::SWF::Movie.new

      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "hello world"
      )

      movie << text
    end

    def test_advance
      assert movie = Ketama::SWF::Movie.new
      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "hello world"
      )
      movie << text
      assert movie.advance
    end

    def test_background
      assert movie = Ketama::SWF::Movie.new
      assert movie.background = [0, 0, 0]
      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "abc"
      )
      text.height = 20
      text.color = [0, 0, 0, 0xff]
      movie << text
      assert movie.advance
      movie.save File.join(Dir::tmpdir, "test_#{@@test_number}.swf")
    end

    def test_with_ttf
      assert movie = Ketama::SWF::Movie.new
      assert movie.background = [0, 0, 0]
      assert text = Ketama::SWF::Text.new()
      text.move_to(0, 50)

      text.font = File.join(ASSETS, 'font01.fdb')
      text.color = [0, 0xff, 0, 0xff]
      text.height = 20
      text << 'abc'

      text.font = Ketama::SWF::Font.open(File.join(ASSETS, 'test.ttf'))
      text.color = [0xff, 0, 0, 0xff]
      text.height = 40
      text << 'def'

      movie << text
      assert movie.advance
      movie.save File.join(Dir::tmpdir, "test_#{@@test_number}.swf")
    end

    def test_save
      assert movie = Ketama::SWF::Movie.new
      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "abc"
      )
      text.height = 20
      text.color = [0xff, 0, 0, 0xff]
      movie << text
      assert movie.advance
      movie.save File.join(Dir::tmpdir, "test_#{@@test_number}.swf")
    end

    def test_set_dimension
      assert movie = Ketama::SWF::Movie.new

      movie.dimension = [300, 250]

      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "abc"
      )
      text.height = 20
      text.color = [0xff, 0, 0, 0xff]
      movie << text
      assert movie.advance
      movie.save File.join(Dir::tmpdir, "test_#{@@test_number}.swf")
    end
  end
end
