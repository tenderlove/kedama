#include <swf_fill.h>

static VALUE new(VALUE klass, VALUE _fill_style)
{
  SWFFillStyle fs;

  Data_Get_Struct(_fill_style, struct SWFFillStyle_s, fs);

  VALUE fill = Data_Wrap_Struct(klass, NULL, destroySWFFill, newSWFFill(fs));
  if(rb_block_given_p()) rb_yield(fill);

  return fill;
}

static VALUE move(VALUE self, VALUE x, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_move(fill, NUM2DBL(x), NUM2DBL(y));

  return self;
}

static VALUE move_to(VALUE self, VALUE x, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_moveTo(fill, NUM2DBL(x), NUM2DBL(y));

  return self;
}

static VALUE fill_style(VALUE self, VALUE x, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  return Data_Wrap_Struct(cKedamaSwfFillStyle, 0, 0,SWFFill_getFillStyle(fill));
}

VALUE cKedamaSwfFill;

void init_swf_fill()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Fill", rb_cObject);

  cKedamaSwfFill = klass;

  rb_define_singleton_method(klass, "new", new, 1);
  rb_define_method(klass, "move", move, 2);
  rb_define_method(klass, "move_to", move_to, 2);
  rb_define_method(klass, "fill_style", fill_style, 0);
}
