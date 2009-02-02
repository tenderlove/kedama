#include <swf_movie.h>

static void deallocate(SWFMovie movie)
{
  destroySWFMovie(movie);
}

static VALUE allocate(VALUE klass)
{
  SWFMovie movie = newSWFMovie();
  return Data_Wrap_Struct(klass, NULL, deallocate, movie);
}

static VALUE add_thing(VALUE self, VALUE thing)
{
  SWFMovie movie;
  SWFBlock block;
  Data_Get_Struct(self, struct SWFMovie_s, movie);
  Data_Get_Struct(thing, struct SWFBlock_s, block);

  SWFMovie_add(movie, block);
  return self;
}

static VALUE advance(VALUE self)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_nextFrame(movie);
  return self;
}

static VALUE save(VALUE self, VALUE filename)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_save(movie, StringValuePtr(filename));
  return self;
}

void init_swf_movie()
{
  VALUE ketama  = rb_define_module("Ketama");
  VALUE swf     = rb_define_module_under(ketama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Movie", rb_cObject);

  rb_define_alloc_func(klass, allocate);
  rb_define_method(klass, "advance", advance, 0);
  rb_define_method(klass, "save", save, 1);
  rb_define_private_method(klass, "add_thing", add_thing, 1);
}
