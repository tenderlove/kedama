#include <swf_text.h>

static void deallocate(SWFText movie)
{
  destroySWFText(movie);
}

static VALUE allocate(VALUE klass)
{
  SWFText text = newSWFText2();
  return Data_Wrap_Struct(klass, NULL, deallocate, text);
}

static VALUE append(VALUE self, VALUE string)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);
  SWFText_addUTF8String(text, StringValuePtr(string), NULL);
  return self;
}

void init_swf_text()
{
  VALUE ketama  = rb_define_module("Ketama");
  VALUE swf     = rb_define_module_under(ketama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Text", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "append", append, 1);
}
