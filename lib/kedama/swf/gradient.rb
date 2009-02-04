module Kedama
  module SWF
    class Gradient
      def initialize
        yield self if block_given?
      end

      ###
      # Add a control point.  Ratio defines the position of the control point.
      #
      # Example:
      #   gradient.add_entry(:ratio => 1, :r => 0xff, :g => 0, :b => 0, :a => 0)
      #   gradient.add_entry(1, 0xff, 0, 0, 0)
      def add_entry *args
        args = args.first if args.first.is_a?(Hash)
        native_add_entry(*(
          args.is_a?(Hash) ? [:ratio, :r, :g, :b, :a].map { |param|
            args[param]
          } : args
        ))
      end

      # Spread modes
      PAD     = 0
      REFLECT = 1
      REPEAT  = 2

      def spread_mode= mode
        mode = self.class.const_get(mode.to_s.upcase.to_sym) rescue mode

        native_spread_mode(mode)
      end

      NORMAL  = 0
      LINEAR  = 1
      def interpolation_mode= mode
        mode = self.class.const_get(mode.to_s.upcase.to_sym) rescue mode

        native_interpolation_mode(mode)
      end
    end
  end
end
