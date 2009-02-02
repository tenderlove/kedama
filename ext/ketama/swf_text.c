#include <swf_text.h>

static void deallocate(SWFText movie)
{
  destroySWFText(movie);
}

static VALUE allocate(VALUE klass)
{
  SWFText text = newSWFText2();
  return Data_Wrap_Struct(klass, NULL, deallocate, text);
}

static VALUE native_set_font(VALUE self, VALUE _font)
{
  SWFText text;
  SWFFont font;
  Data_Get_Struct(self, struct SWFText_s, text);
  Data_Get_Struct(_font, struct SWFFont_s, font);

  SWFText_setFont(text, font);
  return _font;
}

static VALUE set_height(VALUE self, VALUE height)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);

  SWFText_setHeight(text, NUM2DBL(height));
  return height;
}

static VALUE set_spacing(VALUE self, VALUE spacing)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);

  SWFText_setSpacing(text, NUM2DBL(spacing));
  return spacing;
}

static VALUE native_set_color(VALUE self, VALUE _r, VALUE _g, VALUE _b, VALUE _a)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);

  SWFText_setColor(
      text,
      NUM2INT(_r),
      NUM2INT(_g),
      NUM2INT(_b),
      NUM2INT(_a)
  );
  return self;
}

static VALUE append(VALUE self, VALUE string)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);
  SWFText_addUTF8String(text, StringValuePtr(string), NULL);
  return self;
}

static VALUE move_to(VALUE self, VALUE x, VALUE y)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);
  SWFText_moveTo(text, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE width_of(VALUE self, VALUE string)
{
  SWFText text;
  Data_Get_Struct(self, struct SWFText_s, text);
  return rb_float_new(
      SWFText_getUTF8StringWidth(text, StringValuePtr(string))
  );
}

void init_swf_text()
{
  VALUE ketama  = rb_define_module("Ketama");
  VALUE swf     = rb_define_module_under(ketama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Text", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "append", append, 1);
  rb_define_method(klass, "height=", set_height, 1);
  rb_define_method(klass, "spacing=", set_spacing, 1);
  rb_define_method(klass, "move_to", move_to, 2);
  rb_define_method(klass, "width_of", width_of, 1);
  rb_define_private_method(klass, "native_set_font", native_set_font, 1);
  rb_define_private_method(klass, "native_set_color", native_set_color, 4);
}
