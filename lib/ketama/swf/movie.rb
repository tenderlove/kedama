module Ketama
  module SWF
    class Movie
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
    end
  end
end
