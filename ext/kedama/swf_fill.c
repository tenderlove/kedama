#include <swf_fill.h>

VALUE cKedamaSwfFill;

void init_swf_fill()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Fill", rb_cObject);

  cKedamaSwfFill = klass;
}
