require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

require 'tempfile'

module SWF
  class TestMovie < Ketama::TestCase
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

    def test_save
      assert movie = Ketama::SWF::Movie.new
      assert text = Ketama::SWF::Text.new(
        Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb')),
        "abc"
      )
      text.height = 20
      text.color = [255, 255, 255, 0xff]
      movie << text
      assert movie.advance
      movie.save File.join(Dir::tmpdir, 'test01.swf')
    end
  end
end
