module Kedama
  module SWF
    class Gradient
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
    end
  end
end
