#include <swf_font.h>

static void deallocate(SWFFont font)
{
  destroySWFFont(font);
}

static VALUE font_open(VALUE klass, VALUE filename)
{
  SWFFont font = newSWFFont_fromFile(StringValuePtr(filename));
  if(font == NULL) rb_raise(rb_eRuntimeError, "could not read file");
  return Data_Wrap_Struct(klass, NULL, deallocate, font);
}

void init_swf_font()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Font", rb_cObject);

  rb_define_singleton_method(klass, "open", font_open, 1);
}
