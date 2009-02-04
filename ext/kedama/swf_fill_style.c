#include <swf_fill_style.h>

static VALUE from_gradient(VALUE klass, VALUE _gradient, VALUE style)
{
  SWFGradient gradient;
  Data_Get_Struct(_gradient, struct SWFGradient_s, gradient);

  SWFFillStyle fill_style = newSWFGradientFillStyle(gradient, NUM2INT(style));

  return Data_Wrap_Struct(klass, NULL, destroySWFFillStyle, fill_style);
}

static VALUE new(VALUE klass, VALUE _r, VALUE _g, VALUE _b, VALUE _a)
{
  SWFFillStyle fill_style = newSWFSolidFillStyle(
    NUM2INT(_r),
    NUM2INT(_g),
    NUM2INT(_b),
    NUM2INT(_a)
  );
  return Data_Wrap_Struct(klass, NULL, destroySWFFillStyle, fill_style);
}

VALUE cKedamaSwfFillStyle;
void init_swf_fill_style()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "FillStyle", rb_cObject);

  cKedamaSwfFillStyle = klass;

  rb_define_singleton_method(klass, "from_gradient", from_gradient, 2);
  rb_define_singleton_method(klass, "new", new, 4);
}
