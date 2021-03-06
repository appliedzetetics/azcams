
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/lib/ruby/1.8/i486-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/usr
dvidir = $(docdir)
docdir = $(datarootdir)/doc/$(PACKAGE)
localstatedir = $(DESTDIR)/var
vendordir = $(libdir)/ruby/vendor_ruby
datarootdir = $(prefix)/share
sitelibdir = $(sitedir)/$(ruby_version)
sitedir = $(DESTDIR)/usr/local/lib/site_ruby
includedir = $(prefix)/include
vendorlibdir = $(vendordir)/$(ruby_version)
localedir = $(datarootdir)/locale
vendorarchdir = $(vendorlibdir)/$(sitearch)
sysconfdir = $(DESTDIR)/etc
sharedstatedir = $(prefix)/com
bindir = $(exec_prefix)/bin
archdir = $(rubylibdir)/$(arch)
psdir = $(docdir)
pdfdir = $(docdir)
htmldir = $(docdir)
libdir = $(exec_prefix)/lib
datadir = $(datarootdir)
oldincludedir = $(DESTDIR)/usr/include
mandir = $(prefix)/share/man
sitearchdir = $(sitelibdir)/$(sitearch)
libexecdir = $(prefix)/lib/ruby1.8
sbindir = $(exec_prefix)/sbin
rubylibdir = $(libdir)/ruby/$(ruby_version)
infodir = $(prefix)/share/info

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fPIC -fno-strict-aliasing -g -g -O2  -fPIC $(cflags) 
INCFLAGS = -I. -I/home/stephen/pccn/gems/libv8-3.3.10.4-x86-linux/lib/libv8/v8/include -I$(topdir) -I$(hdrdir) -I$(srcdir)
DEFS     = -D_FILE_OFFSET_BITS=64
CPPFLAGS =   $(DEFS) $(cppflags) -Wall -g -rdynamic
CXXFLAGS = $(CFLAGS) 
ldflags  = /home/stephen/pccn/gems/libv8-3.3.10.4-x86-linux/lib/libv8/build/v8/libv8.a -L. -Wl,-Bsymbolic-functions -rdynamic -Wl,-export-dynamic
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CXX) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby1.8
RUBY_SO_NAME = ruby1.8
arch = i486-linux
sitearch = i486-linux
ruby_version = 1.8
ruby = /usr/bin/ruby1.8
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED)  -lpthread -lrt -ldl -lcrypt -lm   -lc -lpthread
SRCS = v8_callbacks.cpp v8_value.cpp v8_handle.cpp v8_date.cpp v8_string.cpp v8_object.cpp v8_debug.cpp v8_weakref.cpp v8.cpp rr.cpp v8_array.cpp v8_try_catch.cpp v8_script.cpp v8_message.cpp v8_v8.cpp v8_function.cpp v8_exception.cpp v8_template.cpp v8_locker.cpp v8_context.cpp v8_external.cpp
OBJS = v8_callbacks.o v8_value.o v8_handle.o v8_date.o v8_string.o v8_object.o v8_debug.o v8_weakref.o v8.o rr.o v8_array.o v8_try_catch.o v8_script.o v8_message.o v8_v8.o v8_function.o v8_exception.o v8_template.o v8_locker.o v8_context.o v8_external.o
TARGET = v8
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/stephen/pccn/gems/therubyracer-0.9.10/lib$(target_prefix)
RUBYARCHDIR = /home/stephen/pccn/gems/therubyracer-0.9.10/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h
