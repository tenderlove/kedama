module Kedama
  module SWF
    class FillStyle
      # Fill styles
      SOLID                       = 0x00
      GRADIENT                    = 0x10
      LINEAR_GRADIENT             = 0x10
      RADIAL_GRADIENT             = 0x12
      FOCAL_GRADIENT              = 0x13
      BITMAP                      = 0x40
      TILED_BITMAP                = 0x40
      CLIPPED_BITMAP              = 0x41
      NONSMOOTHED_TILED_BITMAP    = 0x42
      NONSMOOTHED_CLIPPED_BITMAP  = 0x43

      def == other
        return false unless other.respond_to?(:pointer_id)
        pointer_id == other.send(:pointer_id)
      end
    end
  end
end
