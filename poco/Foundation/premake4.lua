--[[
project "PocoFoundation"
	kind( STATIC and "StaticLib" or "" )
	language "C++"
	files { "src/*.c", "src/*.cpp" }
	excludes { "src/*_*.cpp", "SyslogChannel", "OpcomChannel.cpp" }
    
    configuration "windows"
        excludes { "src/SyslogChannel.cpp", "src/OpcomChannel.cpp" }
        links {"iphlpapi", "ws2_32", "gdi32"}

    configuration "linux"
        excludes { "src/EventLogChannel.cpp", "src/WindowsConsoleChannel.cpp", "src/OpcomChannel.cpp" }
        links {"pthread", "dl", "rt"}
]]--

    make_lib("Foundation")
    make_sample("dir", "Foundation")
    make_sample("DateTime", "Foundation")
    make_sample("Timer", "Foundation")
--[[
project "dir"
	kind "ConsoleApp"
	language "C++"
	files { "samples/dir/src/*.cpp" }
	links { "PocoFoundation", "iphlpapi", "ws2_32", "gdi32" }
    
project "DateTime"
	kind "ConsoleApp"
	language "C++"
	files { "samples/DateTime/src/*.cpp" }
	links { "PocoFoundation", "iphlpapi", "ws2_32", "gdi32" }
    
project "Timer"
	kind "ConsoleApp"
	language "C++"
	files { "samples/Timer/src/*.cpp" }
	links { "PocoFoundation", "iphlpapi", "ws2_32", "gdi32" }
    
]]--