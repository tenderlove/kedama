module Kedama
  module SWF
    class ColorTransform
      def add= values
        set_add(*values)
      end

      def multiply= values
        set_multiply(*values)
      end
    end
  end
end
