module Kedama
  module SWF
    class TextField
      NOEDIT    = (1<<3)   # disables editing
      PASSWORD  = (1<<4)   # hides characters
      MULTILINE = (1<<5)   # multiline and scrollable
      WORDWRAP  = (1<<6)   # enable automatic line wrap
      HTML      = (1<<9)   # renders some HTML tags
      DRAWBOX   = (1<<11)  # draws a border
      NOSELECT  = (1<<12)  # disabled selection
      AUTOSIZE  = (1<<14)  # resizes to textlen

      def font= path
        native_set_font(path.is_a?(String) ? Font.open(path) : path)
      end

      def color= colors
        native_set_color(*colors)
      end

      def options opts
        flags = 0
        opts.each do |k,v|
          flags &= self.class.const_get(k.to_s.upcase) if v
        end
        native_set_flags(flags)
      end
      alias :options= :options

      alias :<< :append
    end
  end
end
