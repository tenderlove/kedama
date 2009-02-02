module Ketama
  module SWF
    class Text
      def initialize font = nil, text = nil
        return unless font && text

        font = Font.open(font) if font.is_a?(String)
        self.font = font
        self.<<(text)
      end

      def << text
        append(text)
      end

      def color= value
        native_set_color(*value)
      end
    end
  end
end
