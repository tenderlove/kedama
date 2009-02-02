require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestText < Ketama::TestCase
    def test_new
      assert Ketama::SWF::Text.new
    end

    def test_new_with_text
      font = Ketama::SWF::Font.from_file()
      Ketama::SWF::Text.new("hello world")
    end
  end
end
