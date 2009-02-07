#include <swf_init_action.h>

static VALUE new(VALUE klass, VALUE _action)
{
  SWFAction action;
  Data_Get_Struct(_action, struct SWFAction_s, action);

  SWFInitAction ia = newSWFInitAction(action);

  /* FIXME: we need to GC init_actions but they try to destroy the Action
   * they were created from.... */
  return Data_Wrap_Struct(klass, NULL, destroySWFInitAction, ia);
}

VALUE cKedamaSwfInitAction;
void init_swf_init_action()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "InitAction", rb_cObject);

  cKedamaSwfInitAction = klass;
  rb_define_singleton_method(klass, "new", new, 1);
}
