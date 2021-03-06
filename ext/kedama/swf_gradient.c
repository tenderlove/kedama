#include <swf_gradient.h>

static VALUE allocate(VALUE klass)
{
  SWFGradient gradient = newSWFGradient();
  return Data_Wrap_Struct(klass, NULL, destroySWFGradient, gradient);
}

static VALUE native_add_entry(VALUE self, VALUE ratio, VALUE r, VALUE g, VALUE b, VALUE a)
{
  SWFGradient gradient;
  Data_Get_Struct(self, struct SWFGradient_s, gradient);
  SWFGradient_addEntry(gradient,
      NUM2DBL(ratio),
      NUM2INT(r),
      NUM2INT(g),
      NUM2INT(b),
      NUM2INT(a)
  );
  return self;
}

static VALUE native_spread_mode(VALUE self, VALUE mode)
{
  SWFGradient gradient;
  Data_Get_Struct(self, struct SWFGradient_s, gradient);

  SWFGradient_setSpreadMode(gradient, NUM2INT(mode));
  return self;
}

static VALUE native_interpolation_mode(VALUE self, VALUE mode)
{
  SWFGradient gradient;
  Data_Get_Struct(self, struct SWFGradient_s, gradient);

  SWFGradient_setInterpolationMode(gradient, NUM2INT(mode));
  return self;
}

static VALUE set_focal_point(VALUE self, VALUE point)
{
  SWFGradient gradient;
  Data_Get_Struct(self, struct SWFGradient_s, gradient);

  SWFGradient_setFocalPoint(gradient, NUM2DBL(point));
  return self;
}

VALUE cKedamaSwfGradient;
void init_swf_gradient()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Gradient", rb_cObject);

  cKedamaSwfGradient = klass;

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "focal_point=", set_focal_point, 1);
  rb_define_private_method(klass, "native_add_entry", native_add_entry, 5);
  rb_define_private_method(klass, "native_spread_mode", native_spread_mode, 1);
  rb_define_private_method(klass, "native_interpolation_mode", native_interpolation_mode, 1);
}
