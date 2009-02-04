module Kedama
  module SWF
    class Shape
      def initialize
        yield self if block_given?
      end
    end
  end
end
