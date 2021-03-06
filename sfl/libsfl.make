# GNU Make project makefile autogenerated by Premake
ifndef config
  config=release32
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),release32)
  OBJDIR     = build/x32/Release/libsfl
  TARGETDIR  = bin
  TARGET     = $(TARGETDIR)/libsfl.a
  DEFINES   += 
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m32 -L/usr/lib32
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug32)
  OBJDIR     = build/x32/Debug/libsfl
  TARGETDIR  = bin
  TARGET     = $(TARGETDIR)/libsfl.a
  DEFINES   += -D_DEBUG -DDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m32 -L/usr/lib32
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = build/x64/Release/libsfl
  TARGETDIR  = bin
  TARGET     = $(TARGETDIR)/libsfl.a
  DEFINES   += 
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m64 -L/usr/lib64
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = build/x64/Debug/libsfl
  TARGETDIR  = bin
  TARGET     = $(TARGETDIR)/libsfl.a
  DEFINES   += -D_DEBUG -DDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m64 -L/usr/lib64
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/sflbits.o \
	$(OBJDIR)/sflcomp.o \
	$(OBJDIR)/sflcons.o \
	$(OBJDIR)/sflconv.o \
	$(OBJDIR)/sflcryp.o \
	$(OBJDIR)/sflcvbs.o \
	$(OBJDIR)/sflcvdp.o \
	$(OBJDIR)/sflcvds.o \
	$(OBJDIR)/sflcvns.o \
	$(OBJDIR)/sflcvsb.o \
	$(OBJDIR)/sflcvsd.o \
	$(OBJDIR)/sflcvsn.o \
	$(OBJDIR)/sflcvst.o \
	$(OBJDIR)/sflcvtp.o \
	$(OBJDIR)/sflcvts.o \
	$(OBJDIR)/sfldate.o \
	$(OBJDIR)/sfldbio.o \
	$(OBJDIR)/sfldir.o \
	$(OBJDIR)/sflenv.o \
	$(OBJDIR)/sflexdr.o \
	$(OBJDIR)/sflfile.o \
	$(OBJDIR)/sflfind.o \
	$(OBJDIR)/sflfort.o \
	$(OBJDIR)/sflhttp.o \
	$(OBJDIR)/sflini.o \
	$(OBJDIR)/sfllang.o \
	$(OBJDIR)/sfllbuf.o \
	$(OBJDIR)/sfllist.o \
	$(OBJDIR)/sflmail.o \
	$(OBJDIR)/sflmath.o \
	$(OBJDIR)/sflmem.o \
	$(OBJDIR)/sflmesg.o \
	$(OBJDIR)/sflmime.o \
	$(OBJDIR)/sflmysql.o \
	$(OBJDIR)/sflnode.o \
	$(OBJDIR)/sflprint.o \
	$(OBJDIR)/sflproc.o \
	$(OBJDIR)/sflslot.o \
	$(OBJDIR)/sflstr.o \
	$(OBJDIR)/sflsymb.o \
	$(OBJDIR)/sflsyst.o \
	$(OBJDIR)/sfltok.o \
	$(OBJDIR)/sfltree.o \
	$(OBJDIR)/sfltron.o \
	$(OBJDIR)/sfluid.o \
	$(OBJDIR)/sflxml.o \
	$(OBJDIR)/sflxmll.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking libsfl
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning libsfl
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/sflbits.o: sflsrc21/sflbits.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcomp.o: sflsrc21/sflcomp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcons.o: sflsrc21/sflcons.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflconv.o: sflsrc21/sflconv.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcryp.o: sflsrc21/sflcryp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvbs.o: sflsrc21/sflcvbs.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvdp.o: sflsrc21/sflcvdp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvds.o: sflsrc21/sflcvds.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvns.o: sflsrc21/sflcvns.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvsb.o: sflsrc21/sflcvsb.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvsd.o: sflsrc21/sflcvsd.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvsn.o: sflsrc21/sflcvsn.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvst.o: sflsrc21/sflcvst.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvtp.o: sflsrc21/sflcvtp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflcvts.o: sflsrc21/sflcvts.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfldate.o: sflsrc21/sfldate.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfldbio.o: sflsrc21/sfldbio.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfldir.o: sflsrc21/sfldir.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflenv.o: sflsrc21/sflenv.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflexdr.o: sflsrc21/sflexdr.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflfile.o: sflsrc21/sflfile.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflfind.o: sflsrc21/sflfind.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflfort.o: sflsrc21/sflfort.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflhttp.o: sflsrc21/sflhttp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflini.o: sflsrc21/sflini.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfllang.o: sflsrc21/sfllang.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfllbuf.o: sflsrc21/sfllbuf.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfllist.o: sflsrc21/sfllist.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmail.o: sflsrc21/sflmail.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmath.o: sflsrc21/sflmath.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmem.o: sflsrc21/sflmem.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmesg.o: sflsrc21/sflmesg.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmime.o: sflsrc21/sflmime.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflmysql.o: sflsrc21/sflmysql.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflnode.o: sflsrc21/sflnode.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflprint.o: sflsrc21/sflprint.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflproc.o: sflsrc21/sflproc.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflslot.o: sflsrc21/sflslot.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflstr.o: sflsrc21/sflstr.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflsymb.o: sflsrc21/sflsymb.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflsyst.o: sflsrc21/sflsyst.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfltok.o: sflsrc21/sfltok.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfltree.o: sflsrc21/sfltree.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfltron.o: sflsrc21/sfltron.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sfluid.o: sflsrc21/sfluid.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflxml.o: sflsrc21/sflxml.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/sflxmll.o: sflsrc21/sflxmll.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
