--
--  BUILD STATIC LIBRARIES?
--
local STATIC = true
local OS = os.get()

--
--  BUILD LIBRARY
--
function make_lib(what, depends)
    project("Poco"..what)
	kind( STATIC and "StaticLib" or "SharedLib" )
	language "C++"
	files { "src/*.c", "src/*.cpp" }
    local includes = {"include"}
    local libs = {}
    depends = depends or ""
    if what:find("Util") then table.insert(libs, "PocoXML") end
    if depends:find("Util") then
        table.insert(includes, "../Util/include")
        table.insert(libs, "PocoUtil")
    end
    if depends:find("Net") then
        table.insert(includes, "../Net/include")
        table.insert(libs, "PocoNet")
    end
    if depends:find("XML") then
        table.insert(includes, "../XML/include")
        table.insert(libs, "PocoXML")
    end
    table.insert(libs, "PocoFoundation")
    if STATIC and OS == "windows" then
        table.insert(libs, "iphlpapi")
        table.insert(libs, "ws2_32")
        table.insert(libs, "gdi32")
    elseif STATIC and (OS == "linux" or OS == "bsd") then
        table.insert(libs, "pthread")
        table.insert(libs, "dl")
        table.insert(libs, "rt")
    end
    includedirs(includes)
    links(libs)
end

--
--  BUILD SAMPLE
--
function make_sample(what, parentlib)
    project(what)
	kind "ConsoleApp"
	language "C++"
	files { "samples/".. what .."/src/*.cpp" }
    flags { "StaticRuntime" }
    -- discern links
	local libs, includes = {}, {}
    parentlib = parentlib or ""
    if parentlib:find("Util") then
        table.insert(includes, "../Util/include")
        table.insert(libs, "PocoUtil")
    end
    if parentlib:find("Net") then
        table.insert(includes, "../Net/include")
        table.insert(libs, "PocoNet")
    end
    if parentlib:find("XML") then
        table.insert(includes, "../XML/include")
        table.insert(libs, "PocoXML")
    end
    table.insert(libs, "PocoFoundation")
    if STATIC and OS == "windows" then
        table.insert(libs, "iphlpapi")
        table.insert(libs, "ws2_32")
        table.insert(libs, "gdi32")
    elseif STATIC and (OS == "linux" or OS == "bsd") then
        table.insert(libs, "pthread")
        table.insert(libs, "dl")
        table.insert(libs, "rt")
    end
    links(libs)
    includedirs(includes)
    
end

--
--  CORE SETTINGS
--
solution "POCO"
	configurations {"Release", "Debug"}
	objdir "build"
    includedirs { "Foundation/include" }
	platforms { "x32", "x64" }
	
	configuration "Release"
		targetdir "bin"
		flags { "Optimize" }
        defines { "NDEBUG" }
		
	configuration "Debug"
		targetdir "bin/debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
        
    configuration "windows"
        defines {"_WIN32", "WINVER=0x500", "POCO_NO_FPENVIRONMENT", "PCRE_STATIC", "POCO_THREAD_STACK_SIZE", "Foundation_Config_INCLUDED", "MINGW32"}
        
    configuration {"linux"}
        defines {"_XOPEN_SOURCE=500", "_REENTRANT", "_THREAD_SAFE", "_FILE_OFFSET_BITS=64", "_LARGEFILE64_SOURCE", "POCO_HAVE_FD_EPOLL"}

--
--  FOUNDATION
--
os.chdir("Foundation")
make_lib("Foundation")
if OS == "windows" then excludes { "src/*_*.cpp", "src/SyslogChannel.cpp", "src/OpcomChannel.cpp" } 
    elseif OS == "linux" then excludes { "src/*_*.cpp", "src/EventLogChannel.cpp", "src/WindowsConsoleChannel.cpp", "src/OpcomChannel.cpp" } 
    elseif OS == "bsd" then excludes { "src/*_*.cpp", "src/EventLogChannel.cpp", "src/WindowsConsoleChannel.cpp", "src/OpcomChannel.cpp" } 
end
make_sample("dir", "Foundation")
make_sample("DateTime", "Foundation")
make_sample("Timer", "Foundation")
os.chdir("..")

--
--  XML
--
os.chdir("XML")
make_lib("XML")
defines {"XML_NS", "XML_DTD", "HAVE_EXPAT_CONFIG_H"}
make_sample("SAXParser", "XML")
make_sample("PrettyPrint", "XML")
make_sample("DOMParser", "XML")
os.chdir("..")

--
--  UTILITY
--
os.chdir("Util")
make_lib("Util", "XML")
if OS ~= "windows" then excludes {"src/WinService.cpp", "src/WinRegistryKey.cpp", "src/WinRegistryConfiguration.cpp"} end
make_sample("SampleServer", "Util,XML")
make_sample("SampleApp", "Util,XML")
make_sample("pkill", "Util,XML")
os.chdir("..")

--
--  NETWORKING
--
os.chdir("Net")
make_lib("Net", "Util,XML")
make_sample("httpget", "Util,Net,XML")
make_sample("download", "Util,Net,XML")
make_sample("dict", "Util,Net,XML")
os.chdir("..")