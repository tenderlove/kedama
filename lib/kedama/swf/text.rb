module Kedama
  module SWF
    class Text
      def initialize font = nil, text = nil
        self.font = font if font
        self.<<(text) if font && text
        yield self if block_given?
      end

      def << text
        append(text)
      end

      def font= path
        native_set_font(path.is_a?(String) ? Font.open(path) : path)
      end

      def color= value
        native_set_color(*value)
      end
    end
  end
end
