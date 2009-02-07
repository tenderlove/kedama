require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestColorTransform < Kedama::TestCase
    def test_new
      cx = ColorTransform.new(1,2,3,4,5.0,6.1,7.2,8.9)
    end
  end
end
