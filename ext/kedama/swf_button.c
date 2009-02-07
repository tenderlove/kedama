#include <swf_button.h>

static VALUE allocate(VALUE klass)
{
  SWFButton button = newSWFButton();
  return Data_Wrap_Struct(klass, NULL, destroySWFButton, button);
}

static VALUE add_character(VALUE self, VALUE _character, VALUE flags)
{
  SWFButton button;
  Data_Get_Struct(self, struct SWFButton_s, button);

  SWFCharacter character;
  Data_Get_Struct(_character, struct SWFCharacter_s, character);

  /* FIXME wrap ButtonRecord */
  SWFButton_addCharacter(button, character, NUM2INT(flags));

  return self;
}

static VALUE add_action(VALUE self, VALUE _action, VALUE flags)
{
  SWFButton button;
  Data_Get_Struct(self, struct SWFButton_s, button);

  SWFAction action;
  Data_Get_Struct(_action, struct SWFAction_s, action);

  SWFButton_addAction(button, action, NUM2INT(flags));

  return self;
}

VALUE cKedamaSwfButton;
void init_swf_button()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Button", rb_cObject);

  cKedamaSwfButton = klass;

  rb_define_alloc_func(klass, allocate);
  /*
SWFButtonRecord SWFButton_addCharacter(SWFButton, SWFCharacter, byte flags);
void SWFButton_addAction(SWFButton button, SWFAction action, int flags);
SWFSoundInstance SWFButton_addSound(SWFButton button, SWFSound action, byte flags);
void SWFButton_setMenu(SWFButton button, int flag);
void SWFButton_setScalingGrid(SWFButton b, int x, int y, int w, int h);
void SWFButton_removeScalingGrid(SWFButton b);
*/
  rb_define_method(klass, "add_character", add_character, 2);
  rb_define_method(klass, "add_action", add_action, 2);
  /*
  rb_define_method(klass, "add_sound", add_sound, 2);
  rb_define_method(klass, "menu=", set_menu, 1);
  rb_define_method(klass, "set_scaling_grid", set_scaling_grid, 4);
  rb_define_method(klass, "remove_scaling_grid", remove_scaling_grid, 0);
  */
}
