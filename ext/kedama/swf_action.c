#include <swf_action.h>

static VALUE new(VALUE klass, VALUE script)
{
  SWFAction action = newSWFAction(StringValuePtr(script));
  VALUE self = Data_Wrap_Struct(klass, NULL, destroySWFAction, action);

  if(rb_block_given_p()) rb_yield(self);

  return self;
}

VALUE cKedamaSwfAction;
void init_swf_action()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Action", rb_cObject);

  cKedamaSwfAction = klass;

  rb_define_singleton_method(klass, "new", new, 1);
}
