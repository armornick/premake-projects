solution "lua-5.1.5-nia"
	configurations {"Release", "Debug"}
	objdir "build"
	
	configuration "Release"
		targetdir "bin/release"
		flags { "Optimize" }
		
	configuration "Debug"
		targetdir "bin/debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
		
project "LStatic"
	kind "StaticLib"
	language "C"
	files { "src/*.c" }
	excludes { "src/lua.c", "src/srlua.c", "src/luac.c", "src/glue.c" }
	targetname "lua51-nia"
	
project "Lua"
	kind "ConsoleApp"
	language "C"
	files { "src/lua.c" }
	libdirs { "bin" }
	links { "LStatic" }
	targetname "lua"
	
project "Luac"
	kind "ConsoleApp"
	language "C"
	files { "src/luac.c" }
	libdirs { "bin" }
	links { "LStatic" }
	targetname "luac"

project "Glue"
	kind "ConsoleApp"
	language "C"
	files { "src/glue.c" }
	libdirs { "bin" }
	targetname "glue"
	
project "Srlua"
	kind "ConsoleApp"
	language "C"
	files { "src/srlua.c" }
	libdirs { "bin" }
	links { "LStatic" }
	targetname "srlua"