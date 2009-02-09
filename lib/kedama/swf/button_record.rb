module Kedama
  module SWF
    class ButtonRecord
	    NULL      = 0
	    NORMAL    = 1
	    LAYER     = 2
	    MULT      = 3
	    SCREEN    = 4
	    LIGHTEN   = 5
	    DARKEN    = 6
	    DIFF      = 7
	    ADD       = 8
	    SUB       = 9
	    INV       = 10
	    ALPHA     = 11
	    ERASE     = 12
	    OVERLAY   = 13
	    HARDLIGHT = 14

      def depth= value
        set_depth value
      end

      def blend_mode= value
        value = self.class.const_get(value.to_s.upcase) rescue value.to_i
        set_blend_mode value
      end
    end
  end
end
