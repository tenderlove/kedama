#include <swf_shape.h>

static VALUE allocate(VALUE klass)
{
  SWFShape shape = newSWFShape();
  return Data_Wrap_Struct(klass, NULL, destroySWFShape, shape);
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

static VALUE move_pen_to(VALUE self, VALUE x, VALUE y)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_movePenTo(shape, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE move_pen(VALUE self, VALUE x, VALUE y)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_movePen(shape, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE pen_x(VALUE self)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  return rb_float_new(SWFShape_getPenX(shape));
}

static VALUE pen_y(VALUE self)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  return rb_float_new(SWFShape_getPenY(shape));
}

static VALUE pen(VALUE self)
{
  SWFShape shape;
  double x, y;
  VALUE list = rb_ary_new();

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_getPen(shape, &x, &y);
  rb_funcall(list, rb_intern("<<"), 1, rb_float_new(x));
  rb_funcall(list, rb_intern("<<"), 1, rb_float_new(y));

  return list;
}

static VALUE draw_cubic_to(VALUE self,
    VALUE bx,
    VALUE by,
    VALUE cx,
    VALUE cy,
    VALUE dx,
    VALUE dy )
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  return INT2NUM(SWFShape_drawCubicTo(shape,
        NUM2DBL(bx),
        NUM2DBL(by),
        NUM2DBL(cx),
        NUM2DBL(cy),
        NUM2DBL(bx),
        NUM2DBL(by)));
}

static VALUE set_line(VALUE self, VALUE w, VALUE r, VALUE g, VALUE b, VALUE a)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);
  SWFShape_setLine(shape,
        NUM2DBL(w),
        NUM2DBL(r),
        NUM2DBL(g),
        NUM2DBL(b),
        NUM2DBL(a)
  );
  return self;
}

static VALUE right_fill_style(VALUE self, VALUE _fill_style)
{
  SWFShape shape;
  SWFFillStyle fill_style;

  Data_Get_Struct(self, struct SWFShape_s, shape);
  Data_Get_Struct(_fill_style, struct SWFFillStyle_s, fill_style);

  SWFShape_setRightFillStyle(shape, fill_style);
  return self;
}

static VALUE draw_line_to(VALUE self, VALUE x, VALUE y)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_drawLineTo(shape, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE draw_line(VALUE self, VALUE x, VALUE y)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_drawLine(shape, NUM2DBL(x), NUM2DBL(y));
  return self;
}

static VALUE draw_circle(VALUE self, VALUE r)
{
  SWFShape shape;

  Data_Get_Struct(self, struct SWFShape_s, shape);

  SWFShape_drawCircle(shape, NUM2DBL(r));
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
  rb_define_method(klass, "move_pen_to", move_pen_to, 2);
  rb_define_method(klass, "move_pen", move_pen, 2);
  rb_define_method(klass, "pen_x", pen_x, 0);
  rb_define_method(klass, "pen_y", pen_y, 0);
  rb_define_method(klass, "pen", pen, 0);
  rb_define_method(klass, "draw_cubic_to", draw_cubic_to, 6);
  rb_define_method(klass, "set_line", set_line, 5);
  rb_define_method(klass, "right_fill_style=", right_fill_style, 1);
  rb_define_method(klass, "draw_line_to", draw_line_to, 2);
  rb_define_method(klass, "draw_line", draw_line, 2);
  rb_define_method(klass, "draw_circle", draw_circle, 1);
}
