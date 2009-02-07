#include <swf_action.h>

static VALUE new(VALUE klass, VALUE script)
{
  SWFAction action = newSWFAction(StringValuePtr(script));
  /* FIXME: we need to GC init_actions but they try to destroy the Action
   * they were created from.... */
  VALUE self = Data_Wrap_Struct(klass, NULL, NULL, action);

  if(rb_block_given_p()) rb_yield(self);

  return self;
}

static VALUE compile(VALUE self, VALUE version)
{
  SWFAction action;
  Data_Get_Struct(self, struct SWFAction_s, action);

  int length;
  if(0 != SWFAction_compile(action, NUM2INT(version), &length)) {
    rb_raise(rb_eRuntimeError, "could not compile script");
  }

  return INT2NUM(length);
}

static VALUE byte_code(VALUE self)
{
  SWFAction action;
  Data_Get_Struct(self, struct SWFAction_s, action);

  int length;
  byte * code;

  if(!(code = SWFAction_getByteCode(action, &length))) {
    rb_raise(rb_eRuntimeError, "could not compile script");
  }

  VALUE codes = rb_str_new((const char *)code, length);

  return codes;
}

static VALUE set_debug(VALUE self, VALUE debug)
{
  SWFAction action;
  Data_Get_Struct(self, struct SWFAction_s, action);

  SWFAction_setDebug(action, NUM2INT(debug));

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
  rb_define_method(klass, "compile", compile, 1);
  rb_define_method(klass, "byte_code", byte_code, 0);
  rb_define_method(klass, "set_debug", set_debug, 1);
}
