## Process this file with automake to produce Makefile.in

if PLATFORM_WIN32
no_undefined = -no-undefined
endif

if PLATFORM_OSX
xobjective_c = "-xobjective-c"
xobjective_cxx = "-xobjective-c++"
xnone = "-xnone"
framework_cocoa = -framework Cocoa
endif

if OS_WIN32
ole32_lib = -lole32
gimpbase_def = gimpbase.def
libglimpsebase_export_symbols = -export-symbols $(srcdir)/gimpbase.def

install-libtool-import-lib:
	$(INSTALL) .libs/libglimpsebase-$(GIMP_API_VERSION).dll.a $(DESTDIR)$(libdir)
	$(INSTALL) $(srcdir)/gimpbase.def $(DESTDIR)$(libdir)

uninstall-libtool-import-lib:
	-rm $(DESTDIR)$(libdir)/libglimpsebase-$(GIMP_API_VERSION).dll.a
	-rm $(DESTDIR)$(libdir)/gimpbase.def
else
libm = -lm
install-libtool-import-lib:
uninstall-libtool-import-lib:
endif

if MS_LIB_AVAILABLE
noinst_DATA = gimpbase-$(GIMP_API_VERSION).lib

install-ms-lib:
	$(INSTALL) gimpbase-$(GIMP_API_VERSION).lib $(DESTDIR)$(libdir)

uninstall-ms-lib:
	-rm $(DESTDIR)$(libdir)/gimpbase-$(GIMP_API_VERSION).lib

gimpbase-@GIMP_API_VERSION@.lib: gimpbase.def
	lib -name:libglimpsebase-$(GIMP_API_VERSION)-@LT_CURRENT_MINUS_AGE@.dll -def:gimpbase.def -out:$@

else
install-ms-lib:
uninstall-ms-lib:
endif

libglimpsebaseincludedir = $(includedir)/gimp-$(GIMP_API_VERSION)/libglimpsebase

AM_CPPFLAGS = \
	-DPREFIX=\""$(prefix)"\"				\
	-DGIMPDIR=\""$(gimpdir)"\"				\
	-DGIMPDATADIR=\""$(gimpdatadir)"\"				\
	-DLOCALEDIR=\""$(gimplocaledir)"\"			\
	-DPLUGINDIR=\""$(gimpplugindir)"\"			\
	-DGIMPSYSCONFDIR=\""$(gimpsysconfdir)"\"			\
	-DGIMP_PACKAGE=\""@PACKAGE@"\"				\
	-DGIMP_DATA_VERSION=\"$(GIMP_DATA_VERSION)\"		\
	-DGIMP_USER_VERSION=\"$(GIMP_USER_VERSION)\"		\
	-DGLIMPSE_APP_VERSION=\"$(GLIMPSE_APP_VERSION)\"	\
	-DGIMP_SYSCONF_VERSION=\"$(GIMP_SYSCONF_VERSION)\"	\
	-DGIMP_PLUGIN_VERSION=\"$(GIMP_PLUGIN_VERSION)\"	\
	-DG_LOG_DOMAIN=\"libglimpseBase\"				\
	-DGIMP_BASE_COMPILATION					\
	-I$(top_srcdir)						\
	$(GIO_CFLAGS)						\
	$(GEXIV2_CFLAGS)					\
	-I$(includedir)

AM_CFLAGS = \
	$(xobjective_c)

AM_CXXFLAGS = \
	$(xobjective_cxx)

AM_CCASFLAGS = \
	-I$(top_builddir)	\
	-I$(top_srcdir)

AM_LDFLAGS = \
	$(xnone)

EXTRA_DIST = \
	gimpbase.def

lib_LTLIBRARIES = libglimpsebase-@GIMP_API_VERSION@.la

# help `make' along by giving another name for the file, which it knows
# how to build
../libglimpsebase/gimpversion.h: gimpversion.h
	@:


libglimpsebase_sources = \
	gimpbase.h		\
	gimpbaseenums.h		\
	gimpcompatenums.h	\
	gimpbasetypes.h		\
	gimpbasetypes.c		\
	gimplimits.h		\
	gimpparam.h		\
	gimpversion.h		\
	\
	gimpbase-private.c	\
	gimpbase-private.h	\
	gimpchecks.c           	\
	gimpchecks.h           	\
	gimpcpuaccel.c		\
	gimpcpuaccel.h		\
	gimpdatafiles.c		\
	gimpdatafiles.h		\
	gimpenv.c		\
	gimpenv.h		\
	gimpmemsize.c		\
	gimpmemsize.h		\
	gimpmetadata.c		\
	gimpmetadata.h		\
	gimpparasite.c		\
	gimpparasite.h		\
	gimpparasiteio.c	\
	gimpparasiteio.h	\
	gimpprotocol.c		\
	gimpprotocol.h		\
	gimprectangle.c		\
	gimprectangle.h		\
	gimpreloc.c		\
	gimpreloc.h		\
	gimpsignal.c            \
	gimpsignal.h            \
	gimpunit.c		\
	gimpunit.h		\
	gimputils.c            	\
	gimputils.h            	\
	gimpvaluearray.c	\
	gimpvaluearray.h	\
	gimpwin32-io.h		\
	gimpwire.c		\
	gimpwire.h

libglimpsebase_built_sources = \
	gimpbaseenums.c		\
	gimpcompatenums.c

libglimpsebase_@GIMP_API_VERSION@_la_SOURCES = \
	$(libglimpsebase_sources)	\
	$(libglimpsebase_built_sources)


libglimpsebaseinclude_HEADERS = \
	gimpbase.h		\
	gimpbaseenums.h		\
	gimpbasetypes.h		\
	gimpcpuaccel.h		\
	gimplimits.h		\
	gimpparam.h		\
	gimpversion.h		\
	\
	gimpchecks.h		\
	gimpdatafiles.h		\
	gimpenv.h		\
	gimpmemsize.h		\
	gimpmetadata.h		\
	gimpparasite.h		\
	gimpparasiteio.h	\
	gimprectangle.h		\
	gimpsignal.h		\
	gimpunit.h		\
	gimputils.h		\
	gimpvaluearray.h

libglimpsebase_@GIMP_API_VERSION@_la_LDFLAGS = \
	-version-info $(LT_VERSION_INFO)	\
	$(no_undefined) 			\
	$(libglimpsebase_export_symbols)		\
	$(framework_cocoa)			\
	$(xnone)

EXTRA_libglimpsebase_@GIMP_API_VERSION@_la_DEPENDENCIES = $(gimpbase_def)

libglimpsebase_@GIMP_API_VERSION@_la_LIBADD = \
	$(GIO_LIBS)	\
	$(GEXIV2_LIBS)	\
	$(libm)		\
	$(ole32_lib)

install-data-local: install-ms-lib install-libtool-import-lib

uninstall-local: uninstall-ms-lib uninstall-libtool-import-lib

#
# test programs, not to be built by default and never installed
#

TESTS = test-cpu-accel

test_cpu_accel_SOURCES = test-cpu-accel.c

test_cpu_accel_DEPENDENCIES = \
	$(top_builddir)/libglimpsebase/libglimpsebase-$(GIMP_API_VERSION).la

test_cpu_accel_LDADD = \
	$(GLIB_LIBS)	\
	$(test_cpu_accel_DEPENDENCIES)


EXTRA_PROGRAMS = test-cpu-accel


#
# rules to generate built sources
#

gen_sources = xgen-bec xgen-cec
CLEANFILES = $(EXTRA_PROGRAMS) $(gen_sources)

xgen-bec: $(srcdir)/gimpbaseenums.h $(GIMP_MKENUMS) Makefile.am
	$(AM_V_GEN) $(GIMP_MKENUMS) \
		--fhead "#include \"config.h\"\n#include <glib-object.h>\n#undef GIMP_DISABLE_DEPRECATED\n#include \"gimpbasetypes.h\"\n#include \"libglimpse/libglimpse-intl.h\"" \
		--fprod "\n/* enumerations from \"@basename@\" */" \
		--vhead "GType\n@enum_name@_get_type (void)\n{\n  static const G@Type@Value values[] =\n  {" \
		--vprod "    { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
		--vtail "    { 0, NULL, NULL }\n  };\n" \
		--dhead "  static const Gimp@Type@Desc descs[] =\n  {" \
		--dprod "    { @VALUENAME@, @valuedesc@, @valuehelp@ },@if ('@valueabbrev@' ne 'NULL')@\n    /* Translators: this is an abbreviated version of @valueudesc@.\n       Keep it short. */\n    { @VALUENAME@, @valueabbrev@, NULL },@endif@" \
		--dtail "    { 0, NULL, NULL }\n  };\n\n  static GType type = 0;\n\n  if (G_UNLIKELY (! type))\n    {\n      type = g_@type@_register_static (\"@EnumName@\", values);\n      gimp_type_set_translation_domain (type, GETTEXT_PACKAGE \"-libglimpse\");\n      gimp_type_set_translation_context (type, \"@enumnick@\");\n      gimp_@type@_set_value_descriptions (type, descs);\n    }\n\n  return type;\n}\n" \
		$< > $@

# copy the generated enum file back to the source directory only if it's
# changed; otherwise, only update its timestamp, so that the recipe isn't
# executed again on the next build, however, allow this to (harmlessly) fail,
# to support building from a read-only source tree.
$(srcdir)/gimpbaseenums.c: xgen-bec
	$(AM_V_GEN) if ! cmp -s $< $@; then \
		cp $< $@; \
	else \
		touch $@ 2> /dev/null \
		|| true; \
	fi

xgen-cec: $(srcdir)/gimpcompatenums.h $(GIMP_MKENUMS) Makefile.am
	$(AM_V_GEN) $(GIMP_MKENUMS) \
		--fhead "#include \"config.h\"\n#include <glib-object.h>\n#include \"gimpbasetypes.h\"\n#include \"gimpcompatenums.h\"\n#include \"libglimpse/libglimpse-intl.h\"" \
		--fprod "\n/* enumerations from \"@basename@\" */" \
		--vhead "GType\n@enum_name@_get_type (void)\n{\n  static const G@Type@Value values[] =\n  {" \
		--vprod "    { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
		--vtail "    { 0, NULL, NULL }\n  };\n" \
		--dhead "  static const Gimp@Type@Desc descs[] =\n  {" \
		--dprod "    { @VALUENAME@, @valuedesc@, @valuehelp@ },@if ('@valueabbrev@' ne 'NULL')@\n    /* Translators: this is an abbreviated version of @valueudesc@.\n       Keep it short. */\n    { @VALUENAME@, @valueabbrev@, NULL },@endif@" \
		--dtail "    { 0, NULL, NULL }\n  };\n\n  static GType type = 0;\n\n  if (G_UNLIKELY (! type))\n    {\n      type = g_@type@_register_static (\"@EnumName@\", values);\n      gimp_type_set_translation_domain (type, GETTEXT_PACKAGE \"-libglimpse\");\n      gimp_type_set_translation_context (type, \"@enumnick@\");\n      gimp_@type@_set_value_descriptions (type, descs);\n    }\n\n  return type;\n}\n" \
		$< > $@

# copy the generated enum file back to the source directory only if it's
# changed; otherwise, only update its timestamp, so that the recipe isn't
# executed again on the next build, however, allow this to (harmlessly) fail,
# to support building from a read-only source tree.
$(srcdir)/gimpcompatenums.c: xgen-cec
	$(AM_V_GEN) if ! cmp -s $< $@; then \
		cp $< $@; \
	else \
		touch $@ 2> /dev/null \
		|| true; \
	fi

DISTCLEANFILES = gimpversion.h
