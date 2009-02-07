#include <swf_action.h>

static VALUE new(VALUE klass, VALUE script)
{
  SWFAction action = newSWFAction(StringValuePtr(script));
  VALUE self = Data_Wrap_Struct(klass, NULL, destroySWFAction, action);

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
}
