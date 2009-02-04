#include <swf_display_item.h>

static VALUE move_to(VALUE self, VALUE x, VALUE y)
{
  SWFDisplayItem di;

  Data_Get_Struct(self, struct SWFDisplayItem_s, di);

  SWFDisplayItem_moveTo(di, NUM2DBL(x), NUM2DBL(y));
  return self;
}

VALUE cKedamaSwfDisplayItem;
void init_swf_display_item()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Shape", rb_cObject);

  cKedamaSwfDisplayItem = klass;

  rb_define_method(klass, "move_to", move_to, 2);
}
