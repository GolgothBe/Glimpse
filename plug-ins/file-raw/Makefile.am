## Process this file with automake to produce Makefile.in
libglimpsebase = $(top_builddir)/libglimpsebase/libglimpsebase-$(GIMP_API_VERSION).la
libglimpsecolor = $(top_builddir)/libglimpsecolor/libglimpsecolor-$(GIMP_API_VERSION).la
libglimpseconfig = $(top_builddir)/libglimpseconfig/libglimpseconfig-$(GIMP_API_VERSION).la
libglimpse = $(top_builddir)/libglimpse/libglimpse-$(GIMP_API_VERSION).la

filerawdatadir = $(gimpdatadir)/file-raw

if OS_WIN32
mwindows = -mwindows
endif

# if HAVE_WINDRES
# include $(top_srcdir)/build-aux/windows/gimprc-plug-ins.rule
# file_darktable_RC = file-darktable.rc.o
# file_rawtherapee_RC = file-rawtherapee.rc.o
# file_raw_placeholder_RC = file-raw-placeholder.rc.o
# endif

AM_LDFLAGS = $(mwindows)

dt_libexecdir = $(gimpplugindir)/plug-ins/file-darktable
rt_libexecdir = $(gimpplugindir)/plug-ins/file-rawtherapee
rp_libexecdir = $(gimpplugindir)/plug-ins/file-raw-placeholder

AM_CPPFLAGS = \
	-I$(top_srcdir)	\
	-I$(includedir)	\
	$(GTK_CFLAGS)	\
	$(GEGL_CFLAGS)

dt_libexec_PROGRAMS = file-darktable
rt_libexec_PROGRAMS = file-rawtherapee
rp_libexec_PROGRAMS = file-raw-placeholder

file_darktable_SOURCES = \
	file-darktable.c	\
	file-raw-formats.h	\
	file-raw-utils.c	\
	file-raw-utils.h

file_rawtherapee_SOURCES = \
	file-rawtherapee.c	\
	file-raw-formats.h	\
	file-raw-utils.c	\
	file-raw-utils.h

file_raw_placeholder_SOURCES = \
	file-raw-formats.h	\
	file-raw-placeholder.c

file_darktable_LDADD = \
	$(libglimpse)		\
	$(libglimpsebase)		\
	$(libglimpsecolor)		\
	$(libglimpseconfig)	\
	$(CAIRO_LIBS)		\
	$(GEGL_LIBS)		\
	$(RT_LIBS)		\
	$(INTLLIBS)		\
	$(file_darktable_RC)

file_rawtherapee_LDADD = \
	$(libglimpse)		\
	$(libglimpsebase)		\
	$(libglimpsecolor)		\
	$(libglimpseconfig)	\
	$(CAIRO_LIBS)		\
	$(GEGL_LIBS)		\
	$(RT_LIBS)		\
	$(INTLLIBS)		\
	$(file_rawtherapee_RC)

file_raw_placeholder_LDADD = \
	$(libglimpse)		\
	$(libglimpsebase)		\
	$(libglimpsecolor)		\
	$(libglimpseconfig)	\
	$(CAIRO_LIBS)		\
	$(GEGL_LIBS)		\
	$(RT_LIBS)		\
	$(INTLLIBS)		\
	$(file_raw_placeholder_RC)

filerawdata_DATA = \
	file-darktable-export-on-exit.lua	\
	file-darktable-get-size.lua

EXTRA_DIST = $(filerawdata_DATA)
