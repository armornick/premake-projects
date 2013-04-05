solution "LuaKit"
	configurations {"Release", "Debug"}
	platforms { "x32", "x64" }
	objdir "build"
	flags { "StaticRuntime" }
	links { "physfs", "lua" }
	
	configuration "Release"
		targetdir "bin"
		flags { "Optimize" }
		
	configuration "Debug"
		targetdir "bin/debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
		
project "Prototype1"
	kind "ConsoleApp"
	language "C"
	targetname "lvfs-proto"
	files { "src/physfs_wrap.c", "src/lua_vfs.c" }
	
project "LuaKit"
	kind "ConsoleApp"
	language "C"
	targetname "luakit"
	files { "src/luakit.c", "src/FileIO.c" }