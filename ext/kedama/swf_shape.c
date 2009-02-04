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

static VALUE solid_fill(VALUE self, VALUE _r, VALUE _g, VALUE _b, VALUE _a)
{
  SWFShape shape;
  Data_Get_Struct(self, struct SWFShape_s, shape);
  SWFFill fill = SWFShape_addSolidFill(shape,
    NUM2INT(_r),
    NUM2INT(_g),
    NUM2INT(_b),
    NUM2INT(_a)
  );
  return Data_Wrap_Struct(cKedamaSwfFill, NULL, destroySWFFill, fill);
}

static VALUE set_right_fill(VALUE self, VALUE _fill)
{
  SWFShape shape;
  SWFFill fill;

  Data_Get_Struct(self, struct SWFShape_s, shape);
  Data_Get_Struct(_fill, struct SWFFill_s, fill);

  SWFShape_setRightFill(shape, fill);
  return self;
}

void init_swf_shape()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Shape", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "version=", set_version, 1);
  rb_define_method(klass, "solid_fill", solid_fill, 4);
  rb_define_method(klass, "right_fill=", set_right_fill, 1);
}
