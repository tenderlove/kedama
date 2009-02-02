module Ketama
  module SWF
    class Movie
      def << thing
        add_thing thing
      end

      def background= colors
        native_set_background(*colors)
      end
    end
  end
end
