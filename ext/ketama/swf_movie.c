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

void init_swf_movie()
{
  VALUE ketama  = rb_define_module("Ketama");
  VALUE swf     = rb_define_module_under(ketama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Movie", rb_cObject);

  rb_define_alloc_func(klass, allocate);
}
