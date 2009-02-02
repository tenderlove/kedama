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

static VALUE native_set_font(VALUE self, VALUE _font)
{
  SWFTextField tf;
  SWFBlock font;
  Data_Get_Struct(self, struct SWFTextField_s, tf);
  Data_Get_Struct(_font, struct SWFBlock_s, font);

  SWFTextField_setFont(tf, font);
  return _font;
}

void init_swf_text_field()
{
  VALUE ketama  = rb_define_module("Ketama");
  VALUE swf     = rb_define_module_under(ketama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "TextField", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_private_method(klass, "native_set_font", native_set_font, 1);
}
