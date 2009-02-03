require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestTextField < Kedama::TestCase
    @@test_number = 0

    def setup
      @@test_number += 1
      @movie = Kedama::SWF::Movie.new
    end

    def test_new
      assert tf = Kedama::SWF::TextField.new
    end

    def test_set_font
      assert tf = Kedama::SWF::TextField.new
      assert tf.font = File.join(ASSETS, 'font01.fdb')
      assert tf.font = Kedama::SWF::Font.open(File.join(ASSETS, 'font01.fdb'))
    end

    def test_set_color
      assert tf = Kedama::SWF::TextField.new
      assert tf.color = [0, 0, 0, 0xff]
    end

    def test_set_height
      assert tf = Kedama::SWF::TextField.new
      assert tf.height = 20
    end

    def test_set_options
      assert tf = Kedama::SWF::TextField.new
      assert tf.options(:noedit => true)
    end

    def test_append
      assert tf = Kedama::SWF::TextField.new
      assert tf << "hello world"
    end
  end
end
