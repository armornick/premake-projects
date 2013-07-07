--------------------------
-- CONFIGURATION
--------------------------
local SQLITE_DIR = "sqlite-amalgamation-3071700/"
local ZLIB_DIR = "zlib-1.2.8/"
local ZZIP_DIR = "zziplib-0.13.59/"
local LIBZIP_DIR = 'libzip-0.11.1/'

--------------------------
-- MAIN SOLUTION
--------------------------
solution "Misc Libs"
	configurations {"Release", "Debug"}
	objdir "build"
	platforms { "x32", "x64" }
    targetdir "bin"
	
	configuration "Release"
		flags { "Optimize" }
		
	configuration "Debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}


--------------------------
-- SQLITE3 PROJECTS
--------------------------
project "libsqlite3"
	kind "StaticLib"
	language "C"
	files { SQLITE_DIR.."sqlite3.c" }
	targetname "sqlite3"
    
project "sqlite3-shell"
    kind "ConsoleApp"
    language "C"
    files { SQLITE_DIR.."shell.c" }
    links { "libsqlite3" }
	targetname "sqlite3"

--------------------------
-- ZLIB
--------------------------
project "zlib"
	kind "StaticLib"
	language "C"
	files { ZLIB_DIR.."*.c" }
	targetname "z"

project "minigzip"
    kind "ConsoleApp"
    language "C"
    files { ZLIB_DIR.."test/minigzip.c" }
	includedirs { ZLIB_DIR }
    links { "zlib" }

project "zlib-example"
    kind "ConsoleApp"
    language "C"
    files { ZLIB_DIR.."test/example.c" }
	includedirs { ZLIB_DIR }
    links { "zlib" }
	targetname "example"

--------------------------
-- ZZIPLIB
--------------------------
project "zziplib"
	kind "StaticLib"
	language "C"
	files { ZZIP_DIR.."zzip/*.c" }
	includedirs { ZLIB_DIR, ZZIP_DIR }
	links { "zlib" }
	defines { "_MSC_VER" }
	targetname "zzip"

project "zzipwrap"
    kind "ConsoleApp"
    language "C"
    files { ZZIP_DIR.."zzipwrap/*.c" }
	includedirs { ZLIB_DIR, ZZIP_DIR }
    links { "zziplib", "zlib" }
	targetname "zzipwrap"