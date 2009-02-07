module Kedama
  module SWF
    class DisplayItem
      def matrix= values
        set_matrix(*values)
      end

      def scale= values
        set_scale(*values)
      end
      
      def color_add= values
        set_color_add(*values)
      end

      def color_mult= values
        set_color_mult(*values)
      end

      alias :depth= :set_depth
      alias :remove :kedama_remove
      alias :name= :set_name
      alias :mask_level= :set_mask_level
      alias :ratio= :set_ratio
      alias :color_transform= :set_c_xform
    end
  end
end
