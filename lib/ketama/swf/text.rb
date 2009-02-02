module Ketama
  module SWF
    class Text
      def initialize text = nil
        self.<<(text) if text
      end

      def << text
        append(text)
      end
    end
  end
end
