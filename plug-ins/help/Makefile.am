## Process this file with automake to produce Makefile.in

libglimpsehelp = libglimpsehelp.a
libglimpsebase = $(top_builddir)/libglimpsebase/libglimpsebase-$(GIMP_API_VERSION).la
libglimpsecolor = $(top_builddir)/libglimpsecolor/libglimpsecolor-$(GIMP_API_VERSION).la
libglimpseconfig = $(top_builddir)/libglimpseconfig/libglimpseconfig-$(GIMP_API_VERSION).la
libglimpsemath = $(top_builddir)/libglimpsemath/libglimpsemath-$(GIMP_API_VERSION).la
libglimpse = $(top_builddir)/libglimpse/libglimpse-$(GIMP_API_VERSION).la

if OS_WIN32
mwindows = -mwindows
endif

if HAVE_WINDRES
include $(top_srcdir)/build-aux/windows/gimprc-plug-ins.rule
help_RC = help.rc.o
endif

AM_CPPFLAGS = \
	-DDATADIR=\""$(gimpdatadir)"\"	\
	-I$(top_srcdir)			\
	$(CAIRO_CFLAGS)			\
	$(GIO_CFLAGS)			\
	$(GEGL_CFLAGS)			\
	$(GDK_PIXBUF_CFLAGS)		\
	-I$(includedir)

AM_LDFLAGS = $(mwindows)

noinst_LIBRARIES = libglimpsehelp.a

libglimpsehelp_a_SOURCES = \
	gimphelptypes.h		\
	gimphelp.c		\
	gimphelp.h		\
	gimphelpdomain.c	\
	gimphelpdomain.h	\
	gimphelpitem.c		\
	gimphelpitem.h		\
	gimphelplocale.c	\
	gimphelplocale.h	\
	gimphelpprogress.c	\
	gimphelpprogress.h	\
	gimphelpprogress-private.h

libexecdir = $(gimpplugindir)/plug-ins/help

libexec_PROGRAMS = help

help_SOURCES = help.c

LDADD = \
	$(libglimpsehelp)		\
	$(libglimpse)		\
	$(libglimpseconfig)	\
	$(libglimpsecolor)		\
	$(libglimpsebase)		\
	$(libglimpsemath)		\
	$(CAIRO_LIBS)		\
	$(GIO_LIBS)		\
	$(GDK_PIXBUF_LIBS)	\
	$(RT_LIBS)		\
	$(INTLLIBS)		\
	$(help_RC)


noinst_PROGRAMS = gimp-help-lookup

gimp_help_lookup_SOURCES = gimp-help-lookup.c

gimp_help_lookup_LDADD = \
	$(libglimpsehelp)	\
	$(libglimpsebase)	\
	$(GIO_LIBS)
