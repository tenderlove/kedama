#include <swf_blur.h>

static VALUE new(VALUE klass, VALUE blur_x, VALUE blur_y, VALUE passes)
{
  SWFBlur blur = newSWFBlur(
      NUM2DBL(blur_x),
      NUM2DBL(blur_y),
      NUM2INT(passes)
  );

  return Data_Wrap_Struct(cKedamaSwfBlur, NULL, destroySWFBlur, blur);
}

VALUE cKedamaSwfBlur;
void init_swf_blur()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Blur", rb_cObject);

  cKedamaSwfBlur = klass;

  rb_define_singleton_method(klass, "new", new, 3);
}
