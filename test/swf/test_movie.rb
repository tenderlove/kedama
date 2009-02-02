require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestMovie < Ketama::TestCase
    def test_new
      Ketama::SWF::Movie.new
    end
  end
end
