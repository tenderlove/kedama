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

static VALUE ascent(VALUE self)
{
  SWFFont font;
  Data_Get_Struct(self, struct SWFFont_s, font);

  return rb_float_new(SWFFont_getAscent(font));
}

static VALUE descent(VALUE self)
{
  SWFFont font;
  Data_Get_Struct(self, struct SWFFont_s, font);

  return rb_float_new(SWFFont_getDescent(font));
}

static VALUE leading(VALUE self)
{
  SWFFont font;
  Data_Get_Struct(self, struct SWFFont_s, font);

  return rb_float_new(SWFFont_getLeading(font));
}

static VALUE name(VALUE self)
{
  SWFFont font;
  Data_Get_Struct(self, struct SWFFont_s, font);

  return rb_str_new2(SWFFont_getName(font));
}

void init_swf_font()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Font", rb_cObject);

  rb_define_singleton_method(klass, "open", font_open, 1);
  rb_define_method(klass, "ascent", ascent, 0);
  rb_define_method(klass, "descent", descent, 0);
  rb_define_method(klass, "leading", leading, 0);
  rb_define_method(klass, "name", name, 0);
}
