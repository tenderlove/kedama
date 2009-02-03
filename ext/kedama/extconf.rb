ENV["ARCHFLAGS"] = "-arch #{`uname -p` =~ /powerpc/ ? 'ppc' : 'i386'}"

require 'mkmf'

LIBDIR = Config::CONFIG['libdir']
INCLUDEDIR = Config::CONFIG['includedir']

use_macports = !(defined?(RUBY_ENGINE) && RUBY_ENGINE != 'ruby')

$LIBPATH << "/opt/local/lib" if use_macports
$CFLAGS << " -O3 -Wall -Wcast-qual -Wwrite-strings -Wmissing-noreturn -Winline"

HEADER_DIRS = [
  INCLUDEDIR,
  '/usr/local/include',
  '/opt/local/include',
  '/usr/include',
]

LIB_DIRS = [
  LIBDIR,
  '/usr/local/lib',
  '/opt/local/lib',
  '/usr/lib'
]

ming_dirs = dir_config('ming')
unless [nil, nil] == ming_dirs
  HEADER_DIRS.unshift ming_dirs.first
  LIB_DIRS.unshift ming_dirs[1]
end

unless find_header('ming.h', *HEADER_DIRS)
  abort "need libming"
end

unless find_library('ming', 'newSWFMovie', *LIB_DIRS)
  abort "need libming"
end

create_makefile('kedama/kedama')
