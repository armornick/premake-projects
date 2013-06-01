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
  OBJDIR     = ../build/x32/Release/PocoFoundation
  TARGETDIR  = ../bin
  TARGET     = $(TARGETDIR)/libPocoFoundation.a
  DEFINES   += -DNDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -Iinclude -Iinclude
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m32 -L/usr/lib32 -L../bin
  LIBS      += -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug32)
  OBJDIR     = ../build/x32/Debug/PocoFoundation
  TARGETDIR  = ../bin/debug
  TARGET     = $(TARGETDIR)/libPocoFoundation.a
  DEFINES   += -D_DEBUG -DDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -Iinclude -Iinclude
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m32
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m32 -L/usr/lib32 -L../bin/debug
  LIBS      += -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/debug/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../build/x64/Release/PocoFoundation
  TARGETDIR  = ../bin
  TARGET     = $(TARGETDIR)/libPocoFoundation.a
  DEFINES   += -DNDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -Iinclude -Iinclude
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m64 -L/usr/lib64 -L../bin
  LIBS      += -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../build/x64/Debug/PocoFoundation
  TARGETDIR  = ../bin/debug
  TARGET     = $(TARGETDIR)/libPocoFoundation.a
  DEFINES   += -D_DEBUG -DDEBUG -D_WIN32 -DWINVER=0x500 -DPOCO_NO_FPENVIRONMENT -DPCRE_STATIC -DPOCO_THREAD_STACK_SIZE -DFoundation_Config_INCLUDED -DMINGW32
  INCLUDES  += -Iinclude -Iinclude
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m64
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m64 -L/usr/lib64 -L../bin/debug
  LIBS      += -lPocoFoundation -liphlpapi -lws2_32 -lgdi32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../bin/debug/libPocoFoundation.a
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/adler32.o \
	$(OBJDIR)/compress.o \
	$(OBJDIR)/crc32.o \
	$(OBJDIR)/deflate.o \
	$(OBJDIR)/infback.o \
	$(OBJDIR)/inffast.o \
	$(OBJDIR)/inflate.o \
	$(OBJDIR)/inftrees.o \
	$(OBJDIR)/pcre_chartables.o \
	$(OBJDIR)/pcre_compile.o \
	$(OBJDIR)/pcre_exec.o \
	$(OBJDIR)/pcre_fullinfo.o \
	$(OBJDIR)/pcre_globals.o \
	$(OBJDIR)/pcre_maketables.o \
	$(OBJDIR)/pcre_newline.o \
	$(OBJDIR)/pcre_ord2utf8.o \
	$(OBJDIR)/pcre_study.o \
	$(OBJDIR)/pcre_tables.o \
	$(OBJDIR)/pcre_try_flipped.o \
	$(OBJDIR)/pcre_ucd.o \
	$(OBJDIR)/pcre_valid_utf8.o \
	$(OBJDIR)/pcre_xclass.o \
	$(OBJDIR)/trees.o \
	$(OBJDIR)/zutil.o \
	$(OBJDIR)/AbstractObserver.o \
	$(OBJDIR)/ActiveDispatcher.o \
	$(OBJDIR)/ArchiveStrategy.o \
	$(OBJDIR)/Ascii.o \
	$(OBJDIR)/ASCIIEncoding.o \
	$(OBJDIR)/AsyncChannel.o \
	$(OBJDIR)/AtomicCounter.o \
	$(OBJDIR)/Base64Decoder.o \
	$(OBJDIR)/Base64Encoder.o \
	$(OBJDIR)/BinaryReader.o \
	$(OBJDIR)/BinaryWriter.o \
	$(OBJDIR)/Bugcheck.o \
	$(OBJDIR)/ByteOrder.o \
	$(OBJDIR)/Channel.o \
	$(OBJDIR)/Checksum.o \
	$(OBJDIR)/Condition.o \
	$(OBJDIR)/Configurable.o \
	$(OBJDIR)/ConsoleChannel.o \
	$(OBJDIR)/CountingStream.o \
	$(OBJDIR)/DateTime.o \
	$(OBJDIR)/DateTimeFormat.o \
	$(OBJDIR)/DateTimeFormatter.o \
	$(OBJDIR)/DateTimeParser.o \
	$(OBJDIR)/Debugger.o \
	$(OBJDIR)/DeflatingStream.o \
	$(OBJDIR)/DigestEngine.o \
	$(OBJDIR)/DigestStream.o \
	$(OBJDIR)/DirectoryIterator.o \
	$(OBJDIR)/DirectoryWatcher.o \
	$(OBJDIR)/DynamicAny.o \
	$(OBJDIR)/DynamicAnyHolder.o \
	$(OBJDIR)/Environment.o \
	$(OBJDIR)/ErrorHandler.o \
	$(OBJDIR)/Event.o \
	$(OBJDIR)/EventArgs.o \
	$(OBJDIR)/EventLogChannel.o \
	$(OBJDIR)/Exception.o \
	$(OBJDIR)/File.o \
	$(OBJDIR)/FileChannel.o \
	$(OBJDIR)/FileStream.o \
	$(OBJDIR)/FileStreamFactory.o \
	$(OBJDIR)/Format.o \
	$(OBJDIR)/Formatter.o \
	$(OBJDIR)/FormattingChannel.o \
	$(OBJDIR)/FPEnvironment.o \
	$(OBJDIR)/Glob.o \
	$(OBJDIR)/Hash.o \
	$(OBJDIR)/HashStatistic.o \
	$(OBJDIR)/HexBinaryDecoder.o \
	$(OBJDIR)/HexBinaryEncoder.o \
	$(OBJDIR)/InflatingStream.o \
	$(OBJDIR)/Latin1Encoding.o \
	$(OBJDIR)/Latin9Encoding.o \
	$(OBJDIR)/LineEndingConverter.o \
	$(OBJDIR)/LocalDateTime.o \
	$(OBJDIR)/LogFile.o \
	$(OBJDIR)/Logger.o \
	$(OBJDIR)/LoggingFactory.o \
	$(OBJDIR)/LoggingRegistry.o \
	$(OBJDIR)/LogStream.o \
	$(OBJDIR)/Manifest.o \
	$(OBJDIR)/MD4Engine.o \
	$(OBJDIR)/MD5Engine.o \
	$(OBJDIR)/MemoryPool.o \
	$(OBJDIR)/MemoryStream.o \
	$(OBJDIR)/Message.o \
	$(OBJDIR)/Mutex.o \
	$(OBJDIR)/NamedEvent.o \
	$(OBJDIR)/NamedMutex.o \
	$(OBJDIR)/NestedDiagnosticContext.o \
	$(OBJDIR)/Notification.o \
	$(OBJDIR)/NotificationCenter.o \
	$(OBJDIR)/NotificationQueue.o \
	$(OBJDIR)/NullChannel.o \
	$(OBJDIR)/NullStream.o \
	$(OBJDIR)/NumberFormatter.o \
	$(OBJDIR)/NumberParser.o \
	$(OBJDIR)/Path.o \
	$(OBJDIR)/PatternFormatter.o \
	$(OBJDIR)/Pipe.o \
	$(OBJDIR)/PipeImpl.o \
	$(OBJDIR)/PipeStream.o \
	$(OBJDIR)/PriorityNotificationQueue.o \
	$(OBJDIR)/Process.o \
	$(OBJDIR)/PurgeStrategy.o \
	$(OBJDIR)/Random.o \
	$(OBJDIR)/RandomStream.o \
	$(OBJDIR)/RefCountedObject.o \
	$(OBJDIR)/RegularExpression.o \
	$(OBJDIR)/RotateStrategy.o \
	$(OBJDIR)/Runnable.o \
	$(OBJDIR)/RWLock.o \
	$(OBJDIR)/Semaphore.o \
	$(OBJDIR)/SHA1Engine.o \
	$(OBJDIR)/SharedLibrary.o \
	$(OBJDIR)/SharedMemory.o \
	$(OBJDIR)/SignalHandler.o \
	$(OBJDIR)/SimpleFileChannel.o \
	$(OBJDIR)/SplitterChannel.o \
	$(OBJDIR)/Stopwatch.o \
	$(OBJDIR)/StreamChannel.o \
	$(OBJDIR)/StreamConverter.o \
	$(OBJDIR)/StreamCopier.o \
	$(OBJDIR)/StreamTokenizer.o \
	$(OBJDIR)/String.o \
	$(OBJDIR)/StringTokenizer.o \
	$(OBJDIR)/SynchronizedObject.o \
	$(OBJDIR)/Task.o \
	$(OBJDIR)/TaskManager.o \
	$(OBJDIR)/TaskNotification.o \
	$(OBJDIR)/TeeStream.o \
	$(OBJDIR)/TemporaryFile.o \
	$(OBJDIR)/TextBufferIterator.o \
	$(OBJDIR)/TextConverter.o \
	$(OBJDIR)/TextEncoding.o \
	$(OBJDIR)/TextIterator.o \
	$(OBJDIR)/Thread.o \
	$(OBJDIR)/ThreadLocal.o \
	$(OBJDIR)/ThreadPool.o \
	$(OBJDIR)/ThreadTarget.o \
	$(OBJDIR)/TimedNotificationQueue.o \
	$(OBJDIR)/Timer.o \
	$(OBJDIR)/Timespan.o \
	$(OBJDIR)/Timestamp.o \
	$(OBJDIR)/Timezone.o \
	$(OBJDIR)/Token.o \
	$(OBJDIR)/Unicode.o \
	$(OBJDIR)/UnicodeConverter.o \
	$(OBJDIR)/URI.o \
	$(OBJDIR)/URIStreamFactory.o \
	$(OBJDIR)/URIStreamOpener.o \
	$(OBJDIR)/UTF16Encoding.o \
	$(OBJDIR)/UTF8Encoding.o \
	$(OBJDIR)/UTF8String.o \
	$(OBJDIR)/UUID.o \
	$(OBJDIR)/UUIDGenerator.o \
	$(OBJDIR)/Void.o \
	$(OBJDIR)/Windows1252Encoding.o \
	$(OBJDIR)/WindowsConsoleChannel.o \

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
	@echo Linking PocoFoundation
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
	@echo Cleaning PocoFoundation
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

$(OBJDIR)/adler32.o: src/adler32.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/compress.o: src/compress.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/crc32.o: src/crc32.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/deflate.o: src/deflate.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/infback.o: src/infback.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/inffast.o: src/inffast.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/inflate.o: src/inflate.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/inftrees.o: src/inftrees.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_chartables.o: src/pcre_chartables.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_compile.o: src/pcre_compile.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_exec.o: src/pcre_exec.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_fullinfo.o: src/pcre_fullinfo.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_globals.o: src/pcre_globals.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_maketables.o: src/pcre_maketables.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_newline.o: src/pcre_newline.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_ord2utf8.o: src/pcre_ord2utf8.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_study.o: src/pcre_study.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_tables.o: src/pcre_tables.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_try_flipped.o: src/pcre_try_flipped.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_ucd.o: src/pcre_ucd.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_valid_utf8.o: src/pcre_valid_utf8.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/pcre_xclass.o: src/pcre_xclass.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/trees.o: src/trees.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/zutil.o: src/zutil.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"
$(OBJDIR)/AbstractObserver.o: src/AbstractObserver.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ActiveDispatcher.o: src/ActiveDispatcher.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ArchiveStrategy.o: src/ArchiveStrategy.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Ascii.o: src/Ascii.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ASCIIEncoding.o: src/ASCIIEncoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/AsyncChannel.o: src/AsyncChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/AtomicCounter.o: src/AtomicCounter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Base64Decoder.o: src/Base64Decoder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Base64Encoder.o: src/Base64Encoder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/BinaryReader.o: src/BinaryReader.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/BinaryWriter.o: src/BinaryWriter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Bugcheck.o: src/Bugcheck.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ByteOrder.o: src/ByteOrder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Channel.o: src/Channel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Checksum.o: src/Checksum.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Condition.o: src/Condition.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Configurable.o: src/Configurable.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ConsoleChannel.o: src/ConsoleChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/CountingStream.o: src/CountingStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DateTime.o: src/DateTime.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DateTimeFormat.o: src/DateTimeFormat.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DateTimeFormatter.o: src/DateTimeFormatter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DateTimeParser.o: src/DateTimeParser.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Debugger.o: src/Debugger.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DeflatingStream.o: src/DeflatingStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DigestEngine.o: src/DigestEngine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DigestStream.o: src/DigestStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DirectoryIterator.o: src/DirectoryIterator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DirectoryWatcher.o: src/DirectoryWatcher.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DynamicAny.o: src/DynamicAny.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DynamicAnyHolder.o: src/DynamicAnyHolder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Environment.o: src/Environment.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ErrorHandler.o: src/ErrorHandler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Event.o: src/Event.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/EventArgs.o: src/EventArgs.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/EventLogChannel.o: src/EventLogChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Exception.o: src/Exception.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/File.o: src/File.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileChannel.o: src/FileChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileStream.o: src/FileStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileStreamFactory.o: src/FileStreamFactory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Format.o: src/Format.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Formatter.o: src/Formatter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FormattingChannel.o: src/FormattingChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FPEnvironment.o: src/FPEnvironment.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Glob.o: src/Glob.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Hash.o: src/Hash.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/HashStatistic.o: src/HashStatistic.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/HexBinaryDecoder.o: src/HexBinaryDecoder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/HexBinaryEncoder.o: src/HexBinaryEncoder.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/InflatingStream.o: src/InflatingStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Latin1Encoding.o: src/Latin1Encoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Latin9Encoding.o: src/Latin9Encoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LineEndingConverter.o: src/LineEndingConverter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LocalDateTime.o: src/LocalDateTime.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LogFile.o: src/LogFile.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Logger.o: src/Logger.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LoggingFactory.o: src/LoggingFactory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LoggingRegistry.o: src/LoggingRegistry.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/LogStream.o: src/LogStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Manifest.o: src/Manifest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MD4Engine.o: src/MD4Engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MD5Engine.o: src/MD5Engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MemoryPool.o: src/MemoryPool.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MemoryStream.o: src/MemoryStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Message.o: src/Message.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Mutex.o: src/Mutex.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NamedEvent.o: src/NamedEvent.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NamedMutex.o: src/NamedMutex.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NestedDiagnosticContext.o: src/NestedDiagnosticContext.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Notification.o: src/Notification.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NotificationCenter.o: src/NotificationCenter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NotificationQueue.o: src/NotificationQueue.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NullChannel.o: src/NullChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NullStream.o: src/NullStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NumberFormatter.o: src/NumberFormatter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/NumberParser.o: src/NumberParser.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Path.o: src/Path.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PatternFormatter.o: src/PatternFormatter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Pipe.o: src/Pipe.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PipeImpl.o: src/PipeImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PipeStream.o: src/PipeStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PriorityNotificationQueue.o: src/PriorityNotificationQueue.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Process.o: src/Process.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/PurgeStrategy.o: src/PurgeStrategy.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Random.o: src/Random.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RandomStream.o: src/RandomStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RefCountedObject.o: src/RefCountedObject.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RegularExpression.o: src/RegularExpression.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RotateStrategy.o: src/RotateStrategy.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Runnable.o: src/Runnable.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/RWLock.o: src/RWLock.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Semaphore.o: src/Semaphore.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SHA1Engine.o: src/SHA1Engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SharedLibrary.o: src/SharedLibrary.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SharedMemory.o: src/SharedMemory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SignalHandler.o: src/SignalHandler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SimpleFileChannel.o: src/SimpleFileChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SplitterChannel.o: src/SplitterChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Stopwatch.o: src/Stopwatch.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/StreamChannel.o: src/StreamChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/StreamConverter.o: src/StreamConverter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/StreamCopier.o: src/StreamCopier.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/StreamTokenizer.o: src/StreamTokenizer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/String.o: src/String.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/StringTokenizer.o: src/StringTokenizer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SynchronizedObject.o: src/SynchronizedObject.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Task.o: src/Task.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TaskManager.o: src/TaskManager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TaskNotification.o: src/TaskNotification.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TeeStream.o: src/TeeStream.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TemporaryFile.o: src/TemporaryFile.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TextBufferIterator.o: src/TextBufferIterator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TextConverter.o: src/TextConverter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TextEncoding.o: src/TextEncoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TextIterator.o: src/TextIterator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Thread.o: src/Thread.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ThreadLocal.o: src/ThreadLocal.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ThreadPool.o: src/ThreadPool.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ThreadTarget.o: src/ThreadTarget.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/TimedNotificationQueue.o: src/TimedNotificationQueue.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timer.o: src/Timer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timespan.o: src/Timespan.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timestamp.o: src/Timestamp.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timezone.o: src/Timezone.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Token.o: src/Token.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Unicode.o: src/Unicode.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UnicodeConverter.o: src/UnicodeConverter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/URI.o: src/URI.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/URIStreamFactory.o: src/URIStreamFactory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/URIStreamOpener.o: src/URIStreamOpener.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UTF16Encoding.o: src/UTF16Encoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UTF8Encoding.o: src/UTF8Encoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UTF8String.o: src/UTF8String.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UUID.o: src/UUID.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/UUIDGenerator.o: src/UUIDGenerator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Void.o: src/Void.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Windows1252Encoding.o: src/Windows1252Encoding.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WindowsConsoleChannel.o: src/WindowsConsoleChannel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
