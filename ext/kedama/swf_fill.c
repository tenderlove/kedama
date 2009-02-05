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

static VALUE skew_x(VALUE self, VALUE x)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_skewX(fill, NUM2DBL(x));
  return self;
}

static VALUE skew_x_to(VALUE self, VALUE x)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_skewXTo(fill, NUM2DBL(x));
  return self;
}

static VALUE skew_y(VALUE self, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_skewY(fill, NUM2DBL(y));
  return self;
}

static VALUE skew_y_to(VALUE self, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_skewYTo(fill, NUM2DBL(y));
  return self;
}

static VALUE scale_x(VALUE self, VALUE x)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleX(fill, NUM2DBL(x));
  return self;
}

static VALUE scale_x_to(VALUE self, VALUE x)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleXTo(fill, NUM2DBL(x));
  return self;
}

static VALUE scale_y(VALUE self, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleY(fill, NUM2DBL(y));
  return self;
}

static VALUE scale_y_to(VALUE self, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleYTo(fill, NUM2DBL(y));
  return self;
}

static VALUE scale_xy(VALUE self, VALUE x, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleXY(fill, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE scale_xy_to(VALUE self, VALUE x, VALUE y)
{
  SWFFill fill;
  Data_Get_Struct(self, struct SWFFill_s, fill);

  SWFFill_scaleXYTo(fill, NUM2DBL(x), NUM2DBL(y));
  return self;
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
  rb_define_method(klass, "skew_x", skew_x, 1);
  rb_define_method(klass, "skew_x_to", skew_x_to, 1);
  rb_define_method(klass, "skew_y", skew_y, 1);
  rb_define_method(klass, "skew_y_to", skew_y_to, 1);
  rb_define_method(klass, "scale_x",    scale_x, 1);
  rb_define_method(klass, "scale_x_to", scale_x_to, 1);
  rb_define_method(klass, "scale_y",    scale_y, 1);
  rb_define_method(klass, "scale_y_to", scale_y_to, 1);
  rb_define_method(klass, "scale_xy", scale_xy, 2);
  rb_define_method(klass, "scale_xy_to", scale_xy_to, 2);
}
