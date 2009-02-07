#include <swf_color_transform.h>

static VALUE new(VALUE klass, VALUE rAdd, VALUE gAdd, VALUE bAdd, VALUE aAdd,
    VALUE rMult, VALUE gMult, VALUE bMult, VALUE aMult)
{
  SWFCXform cxform = newSWFCXform(
    NUM2INT(rAdd),
    NUM2INT(gAdd),
    NUM2INT(bAdd),
    NUM2INT(aAdd),
    NUM2DBL(rMult),
    NUM2DBL(gMult),
    NUM2DBL(bMult),
    NUM2DBL(aMult)
  );
  return Data_Wrap_Struct(klass, NULL, destroySWFCXform, cxform);
}

VALUE cKedamaSwfColorTransform;
void init_swf_color_transform()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "ColorTransform", rb_cObject);

  cKedamaSwfColorTransform = klass;

  rb_define_singleton_method(klass, "new", new, 8);
}
