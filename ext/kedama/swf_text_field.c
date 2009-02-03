#include <swf_text_field.h>

static void deallocate(SWFTextField tf)
{
  destroySWFTextField(tf);
}

static VALUE allocate(VALUE klass)
{
  SWFTextField tf = newSWFTextField();
  return Data_Wrap_Struct(klass, NULL, deallocate, tf);
}

static VALUE native_set_color(VALUE self, VALUE _r, VALUE _g, VALUE _b, VALUE _a)
{
  SWFTextField tf;
  Data_Get_Struct(self, struct SWFTextField_s, tf);

  SWFTextField_setColor(
      tf,
      NUM2INT(_r),
      NUM2INT(_g),
      NUM2INT(_b),
      NUM2INT(_a)
  );
  return self;
}

static VALUE native_set_font(VALUE self, VALUE _font)
{
  SWFTextField tf;
  SWFBlock font;
  Data_Get_Struct(self, struct SWFTextField_s, tf);
  Data_Get_Struct(_font, struct SWFBlock_s, font);

  SWFTextField_setFont(tf, font);
  return _font;
}

static VALUE set_height(VALUE self, VALUE height)
{
  SWFTextField tf;
  Data_Get_Struct(self, struct SWFTextField_s, tf);

  SWFTextField_setHeight(tf, NUM2DBL(height));
  return height;
}

void init_swf_text_field()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "TextField", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "height=", set_height, 1);
  rb_define_private_method(klass, "native_set_font", native_set_font, 1);
  rb_define_private_method(klass, "native_set_color", native_set_color, 4);
}
