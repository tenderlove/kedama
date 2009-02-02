require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestTextField < Ketama::TestCase
    @@test_number = 0

    def setup
      @@test_number += 1
      @movie = Ketama::SWF::Movie.new
    end

    def test_new
      assert tf = Ketama::SWF::TextField.new
    end

    def test_set_font
      assert tf = Ketama::SWF::TextField.new
      assert tf.font = File.join(ASSETS, 'font01.fdb')
      assert tf.font = Ketama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
    end
  end
end
