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

static VALUE add(VALUE klass, VALUE rAdd, VALUE gAdd, VALUE bAdd, VALUE aAdd)
{
  SWFCXform cxform = newSWFAddCXform(
    NUM2INT(rAdd),
    NUM2INT(gAdd),
    NUM2INT(bAdd),
    NUM2INT(aAdd)
  );
  return Data_Wrap_Struct(klass, NULL, destroySWFCXform, cxform);
}

static VALUE multiply(VALUE klass,
    VALUE rMult, VALUE gMult, VALUE bMult, VALUE aMult)
{
  SWFCXform cxform = newSWFMultCXform(
    NUM2DBL(rMult),
    NUM2DBL(gMult),
    NUM2DBL(bMult),
    NUM2DBL(aMult)
  );
  return Data_Wrap_Struct(klass, NULL, destroySWFCXform, cxform);
}

static VALUE set_multiply(VALUE self,
    VALUE rMult, VALUE gMult, VALUE bMult, VALUE aMult)
{
  SWFCXform cxform;
  Data_Get_Struct(self, struct SWFCXform_s, cxform);

  SWFCXform_setColorMult(cxform,
    NUM2DBL(rMult),
    NUM2DBL(gMult),
    NUM2DBL(bMult),
    NUM2DBL(aMult)
  );
  return self;
}

static VALUE set_add(VALUE self, VALUE rAdd, VALUE gAdd, VALUE bAdd, VALUE aAdd)
{
  SWFCXform cxform;
  Data_Get_Struct(self, struct SWFCXform_s, cxform);

  SWFCXform_setColorAdd(cxform,
    NUM2INT(rAdd),
    NUM2INT(gAdd),
    NUM2INT(bAdd),
    NUM2INT(aAdd)
  );
  return self;
}

VALUE cKedamaSwfColorTransform;
void init_swf_color_transform()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "ColorTransform", rb_cObject);

  cKedamaSwfColorTransform = klass;

  rb_define_singleton_method(klass, "new", new, 8);
  rb_define_singleton_method(klass, "add", add, 4);
  rb_define_singleton_method(klass, "multiply", multiply, 4);
  rb_define_method(klass, "set_multiply", set_multiply, 4);
  rb_define_method(klass, "set_add", set_add, 4);
}
