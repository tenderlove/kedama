module Kedama
  module SWF
    class Action
      def debug= value
        set_debug(value ? 1 : 0)
      end

      def init
        InitAction.new(self)
      end
    end
  end
end
