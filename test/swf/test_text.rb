require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestText < Ketama::TestCase
    def test_new
      assert Ketama::SWF::Text.new
    end

    def test_new_with_text
      font = Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
      text = Ketama::SWF::Text.new(font, "hello world")
    end

    def test_set_height
      font = Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
      text = Ketama::SWF::Text.new(font, "hello world")
      text.height = 20
    end
  end
end
