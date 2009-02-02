module Kedama
  module SWF
    class Text
      def initialize font = nil, text = nil
        return unless font && text

        self.font = font
        self.<<(text)
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
