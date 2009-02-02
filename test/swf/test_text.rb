require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestText < Ketama::TestCase
    def test_new
      Ketama::SWF::Text.new
    end

    def test_new_with_text
      Ketama::SWF::Text.new("hello world")
    end
  end
end
