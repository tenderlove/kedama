module Ketama
  module SWF
    class TextField
      def font= path
        native_set_font(path.is_a?(String) ? Font.open(path) : path)
      end
    end
  end
end
