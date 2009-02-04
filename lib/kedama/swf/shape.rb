module Kedama
  module SWF
    class Shape
      def initialize
        yield self if block_given?
      end

      def line= opts
        if opts.is_a?(Hash)
          return set_line(opts[:width], opts[:r], opts[:g], opts[:b], opts[:a])
        end
        set_line(*opts)
      end
    end
  end
end
