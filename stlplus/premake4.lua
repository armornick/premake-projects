local STLPLUS_DIR = "stlplus3-03-09/"

solution "StlPlus"
	configurations {"Release", "Debug"}
	objdir "build"
	platforms { "x32", "x64" }
	targetdir "bin"
	includedirs { STLPLUS_DIR.."containers/",STLPLUS_DIR.."portability/",STLPLUS_DIR.."persistence/",STLPLUS_DIR.."subsystems/",STLPLUS_DIR.."strings/" }
	flags {"StaticRuntime"}
	
	configuration "Release"
		flags { "Optimize" }
		
	configuration "Debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
	
	configuration "linux"
		defines {"LINUX"}
	
	-- fixes for statically-linked C++ executables with Mingw32
	configuration { "windows", "gmake" }
		linkoptions {"-static-libgcc", "-static-libstdc++"}

local make_lib = function (name, dir, libs)

libs = libs or {}

project(name)
	kind "StaticLib"
	language "C++"
	files { dir.."*.cpp" }
	targetname("stlplus_"..name)
	links(ll)

end

make_lib("containers", STLPLUS_DIR.."containers/") -- header only
make_lib("portability", STLPLUS_DIR.."portability/", {"ws2_32"})
make_lib("persistence", STLPLUS_DIR.."persistence/", {"containers", "portability"})
make_lib("subsystems", STLPLUS_DIR.."subsystems/", {"containers", "portability"})
make_lib("strings", STLPLUS_DIR.."strings/", {"containers", "portability"})

project "fs_example"
	kind "ConsoleApp"
	language "C++"
	files { "src/file_test.cpp" }
	links { "portability" }