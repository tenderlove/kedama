#include <swf_matrix.h>

static VALUE translate_y(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return INT2NUM(SWFMatrix_getTranslateY(matrix));
}

static VALUE translate_x(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return INT2NUM(SWFMatrix_getTranslateX(matrix));
}

static VALUE rotate0(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return rb_float_new(SWFMatrix_getRotate0(matrix));
}

static VALUE rotate1(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return rb_float_new(SWFMatrix_getRotate1(matrix));
}

static VALUE scale_x(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return rb_float_new(SWFMatrix_getScaleX(matrix));
}

static VALUE scale_y(VALUE self)
{
  SWFMatrix matrix;
  Data_Get_Struct(self, struct SWFMatrix_s, matrix);

  return rb_float_new(SWFMatrix_getScaleY(matrix));
}

VALUE cKedamaSwfMatrix;
void init_swf_matrix()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Matrix", rb_cObject);

  cKedamaSwfMatrix = klass;

  rb_define_method(klass, "scale_x", scale_x, 0);
  rb_define_method(klass, "scale_y", scale_y, 0);
  rb_define_method(klass, "rotate0", rotate0, 0);
  rb_define_method(klass, "rotate1", rotate1, 0);
  rb_define_method(klass, "translate_x", translate_x, 0);
  rb_define_method(klass, "translate_y", translate_y, 0);
}
