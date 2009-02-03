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

    def test_new_with_args
      assert tf = Kedama::SWF::TextField.new(
        File.join(ASSETS, 'font01.fdb'), 'hello'
      )
    end

    def test_block
      called = false
      Kedama::SWF::TextField.new do |tf|
        tf.font = File.join(ASSETS, 'font01.fdb')
        called = true
      end
      assert called
    end

    def test_add_to_movie
      assert movie = Kedama::SWF::Movie.new
      movie.frame do |frame|
        frame << Kedama::SWF::TextField.new do |text|
          text.font = File.join(ASSETS, 'font01.fdb')
          text.color = [0, 0, 0, 0xff]
          text << 'balls'
        end
      end
    end

    def test_set_bounds
      assert tf = Kedama::SWF::TextField.new
      assert tf.bounds = [10, 10]
      assert tf.bounds(10, 10)
    end

    def test_set_variable_name
      assert tf = Kedama::SWF::TextField.new
      assert tf.variable_name = 'hello'
    end

    %w{
        left_margin
        right_margin
        field_height 
        indentation 
        line_spacing
        padding
    }.each do |name|
      define_method(:"test_set_#{name}") do
        assert tf = Kedama::SWF::TextField.new
        assert tf.send(:"#{name}=", 100.0)
      end
    end
  end
end
