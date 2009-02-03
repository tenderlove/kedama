#include <swf_shape.h>

static void deallocate(SWFShape shape)
{
  destroySWFShape(shape);
}

static VALUE allocate(VALUE klass)
{
  SWFShape shape = newSWFShape();
  return Data_Wrap_Struct(klass, NULL, deallocate, shape);
}

static VALUE set_version(VALUE self, VALUE version)
{
  SWFShape shape;
  Data_Get_Struct(self, struct SWFShape_s, shape);
  SWFShape_useVersion(shape, NUM2INT(version));
  return self;
}

void init_swf_shape()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Shape", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "version=", set_version, 1);
}
