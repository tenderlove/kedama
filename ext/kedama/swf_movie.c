#include <swf_movie.h>

static VALUE add_thing(VALUE self, VALUE thing)
{
  SWFMovie movie;
  SWFBlock block;
  Data_Get_Struct(self, struct SWFMovie_s, movie);
  Data_Get_Struct(thing, struct SWFBlock_s, block);

  SWFDisplayItem di = SWFMovie_add(movie, block);

  return Data_Wrap_Struct(cKedamaSwfDisplayItem, NULL, NULL, di);
}

static VALUE advance(VALUE self)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_nextFrame(movie);
  return self;
}

static VALUE native_set_background(VALUE self, VALUE _r, VALUE _g, VALUE _b)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_setBackground(
      movie,
      NUM2INT(_r),
      NUM2INT(_g),
      NUM2INT(_b)
  );
  return self;
}

static VALUE save(VALUE self, VALUE filename)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_save(movie, StringValuePtr(filename));
  return self;
}

static VALUE native_set_dimension(VALUE self, VALUE _x, VALUE _y)
{
  SWFMovie movie;
  Data_Get_Struct(self, struct SWFMovie_s, movie);

  SWFMovie_setDimension(
      movie,
      (float)NUM2DBL(_x),
      (float)NUM2DBL(_y)
  );
  return self;
}

static VALUE with_version(VALUE klass, VALUE version)
{
  SWFMovie movie = newSWFMovieWithVersion(NUM2INT(version));
  return Data_Wrap_Struct(klass, NULL, destroySWFMovie, movie);
}

void init_swf_movie()
{
  VALUE kedama  = rb_define_module("Kedama");
  VALUE swf     = rb_define_module_under(kedama, "SWF");
  VALUE klass   = rb_define_class_under(swf, "Movie", rb_cObject);

  rb_define_method(klass, "advance", advance, 0);
  rb_define_method(klass, "save", save, 1);
  rb_define_singleton_method(klass, "with_version", with_version, 1);
  rb_define_private_method(klass, "add_thing", add_thing, 1);
  rb_define_private_method(klass, "native_set_background", native_set_background, 3);
  rb_define_private_method(klass, "native_set_dimension", native_set_dimension, 2);
}
