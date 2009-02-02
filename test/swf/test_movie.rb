require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

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
  end
end
