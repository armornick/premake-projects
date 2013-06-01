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
  OBJDIR     = ../build/x32/Release/PocoUtil
  TARGETDIR  = ../bin
  TARGET     = $(TARGETDIR)/libPocoUtil.a
  DEFINES   += -DNDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -I../Foundation/include -Iinclude -I../XML/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m32 -L/usr/lib32 -L../bin
  LIBS      += -lPocoXML -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/libPocoXML.a ../bin/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug32)
  OBJDIR     = ../build/x32/Debug/PocoUtil
  TARGETDIR  = ../bin/debug
  TARGET     = $(TARGETDIR)/libPocoUtil.a
  DEFINES   += -D_DEBUG -DDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -I../Foundation/include -Iinclude -I../XML/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m32 -L/usr/lib32 -L../bin/debug
  LIBS      += -lPocoXML -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/debug/libPocoXML.a ../bin/debug/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../build/x64/Release/PocoUtil
  TARGETDIR  = ../bin
  TARGET     = $(TARGETDIR)/libPocoUtil.a
  DEFINES   += -DNDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -I../Foundation/include -Iinclude -I../XML/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m64 -L/usr/lib64 -L../bin
  LIBS      += -lPocoXML -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/libPocoXML.a ../bin/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../build/x64/Debug/PocoUtil
  TARGETDIR  = ../bin/debug
  TARGET     = $(TARGETDIR)/libPocoUtil.a
  DEFINES   += -D_DEBUG -DDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -I../Foundation/include -Iinclude -I../XML/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m64 -L/usr/lib64 -L../bin/debug
  LIBS      += -lPocoXML -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/debug/libPocoXML.a ../bin/debug/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/AbstractConfiguration.o \
	$(OBJDIR)/Application.o \
	$(OBJDIR)/ConfigurationMapper.o \
	$(OBJDIR)/ConfigurationView.o \
	$(OBJDIR)/FilesystemConfiguration.o \
	$(OBJDIR)/HelpFormatter.o \
	$(OBJDIR)/IniFileConfiguration.o \
	$(OBJDIR)/IntValidator.o \
	$(OBJDIR)/LayeredConfiguration.o \
	$(OBJDIR)/LoggingConfigurator.o \
	$(OBJDIR)/LoggingSubsystem.o \
	$(OBJDIR)/MapConfiguration.o \
	$(OBJDIR)/Option.o \
	$(OBJDIR)/OptionCallback.o \
	$(OBJDIR)/OptionException.o \
	$(OBJDIR)/OptionProcessor.o \
	$(OBJDIR)/OptionSet.o \
	$(OBJDIR)/PropertyFileConfiguration.o \
	$(OBJDIR)/RegExpValidator.o \
	$(OBJDIR)/ServerApplication.o \
	$(OBJDIR)/Subsystem.o \
	$(OBJDIR)/SystemConfiguration.o \
	$(OBJDIR)/Timer.o \
	$(OBJDIR)/TimerTask.o \
	$(OBJDIR)/Validator.o \
	$(OBJDIR)/WinRegistryConfiguration.o \
	$(OBJDIR)/WinRegistryKey.o \
	$(OBJDIR)/WinService.o \
	$(OBJDIR)/XMLConfiguration.o \

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
	@echo Linking PocoUtil
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
	@echo Cleaning PocoUtil
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
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/AbstractConfiguration.o: src/AbstractConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Application.o: src/Application.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ConfigurationMapper.o: src/ConfigurationMapper.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ConfigurationView.o: src/ConfigurationView.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FilesystemConfiguration.o: src/FilesystemConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/HelpFormatter.o: src/HelpFormatter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/IniFileConfiguration.o: src/IniFileConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/IntValidator.o: src/IntValidator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LayeredConfiguration.o: src/LayeredConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LoggingConfigurator.o: src/LoggingConfigurator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LoggingSubsystem.o: src/LoggingSubsystem.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MapConfiguration.o: src/MapConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Option.o: src/Option.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/OptionCallback.o: src/OptionCallback.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/OptionException.o: src/OptionException.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/OptionProcessor.o: src/OptionProcessor.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/OptionSet.o: src/OptionSet.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PropertyFileConfiguration.o: src/PropertyFileConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RegExpValidator.o: src/RegExpValidator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ServerApplication.o: src/ServerApplication.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Subsystem.o: src/Subsystem.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SystemConfiguration.o: src/SystemConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timer.o: src/Timer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TimerTask.o: src/TimerTask.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Validator.o: src/Validator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WinRegistryConfiguration.o: src/WinRegistryConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WinRegistryKey.o: src/WinRegistryKey.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WinService.o: src/WinService.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/XMLConfiguration.o: src/XMLConfiguration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)