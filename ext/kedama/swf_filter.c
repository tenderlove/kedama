#include <swf_filter.h>

static VALUE from_blur(VALUE klass, VALUE _blur)
{
  SWFBlur blur;
  Data_Get_Struct(_blur, struct Blur_s, blur);

  SWFFilter f = newBlurFilter(blur);

  return Data_Wrap_Struct(cKedamaSwfFilter, NULL, destroySWFFilter, f);
}

VALUE cKedamaSwfFilter;
void init_swf_filter()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Filter", rb_cObject);

  cKedamaSwfFilter = klass;

  rb_define_singleton_method(klass, "from_blur", from_blur, 1);
}
