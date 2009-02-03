require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestShape < Kedama::TestCase
    def test_new
      assert Kedama::SWF::Shape.new
    end
  end
end
