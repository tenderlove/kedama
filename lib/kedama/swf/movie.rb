module Kedama
  module SWF
    class Movie
      def initialize
        yield self if block_given?
      end

      def << thing
        add_thing thing
      end

      def background= colors
        native_set_background(*colors)
      end

      ###
      # Set the x,y dimensions for this Movie.
      # For example, setting the movie to 300x250:
      #   movie.dimensions = [300, 250]
      def dimension= dimension
        native_set_dimension(*dimension)
      end

      def frame &block
        block.call(self)
        self.advance
      end
    end
  end
end
