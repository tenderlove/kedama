module Kedama
  module SWF
    class TextField
      def font= path
        native_set_font(path.is_a?(String) ? Font.open(path) : path)
      end

      def color= colors
        native_set_color(*colors)
      end
    end
  end
end
