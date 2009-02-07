module Kedama
  module SWF
    class Button
      HIT    = (1<<3)
      DOWN   = (1<<2)
      OVER   = (1<<1)
      UP     = (1<<0)
      OVERDOWNTOIDLE    = (1<<8)
      IDLETOOVERDOWN    = (1<<7)
      OUTDOWNTOIDLE     = (1<<6)
      OUTDOWNTOOVERDOWN = (1<<5)
      OVERDOWNTOOUTDOWN = (1<<4)
      OVERDOWNTOOVERUP  = (1<<3)
      OVERUPTOOVERDOWN  = (1<<2)
      OVERUPTOIDLE      = (1<<1)
      IDLETOOVERUP      = (1<<0)

      MOUSEUPOUTSIDE  = OUTDOWNTOIDLE
      DRAGOVER        = (OUTDOWNTOOVERDOWN | IDLETOOVERDOWN)
      DRAGOUT         = (OVERDOWNTOOUTDOWN | OVERDOWNTOIDLE)
      MOUSEUP         = OVERDOWNTOOVERUP
      MOUSEDOWN       = OVERUPTOOVERDOWN
      MOUSEOUT        = OVERUPTOIDLE
      MOUSEOVER       = IDLETOOVERUP

      def initialize
        yield self if block_given?
      end
    end
  end
end
