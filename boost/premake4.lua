solution "Boost"
	configurations { "Debug", "Release" }
	flags { "StaticRuntime" }
	defines { "BOOST_ALL_NO_LIB" }
	-- setup directories
	location "build"
	targetdir "bin"
	includedirs {"include"}
	-- for when using Mingw-w64
	configuration {"gmake"}
		linkoptions("-m32") -- for Mingw64
		buildoptions {"-m32"} -- for Mingw64
		
	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }

project "BoostRegex"
	kind "StaticLib"
	language "C++"
	targetname "boost_regex"
	files { "boost_regex/*.cpp" }

project "RegexExample"
	kind "ConsoleApp"
	language "C++"
	targetname "grep"
	files { "examples/grep.cpp" }
	links { "BoostRegex", "BoostProgramOptions" }
	
project "BoostFilesystem"
	kind "StaticLib"
	language "C++"
	targetname "boost_filesystem"
	defines { "BOOST_FILESYSTEM_STATIC_LINK=1" }
	files { "boost_filesystem/*.cpp" }

project "FilesystemExample"
	kind "ConsoleApp"
	language "C++"
	targetname "ls"
	files { "examples/simple_ls.cpp" }
	links { "BoostFilesystem" }

project "BoostProgramOptions"
	kind "StaticLib"
	language "C++"
	targetname "boost_program_options"
	files { "boost_program_options/*.cpp" }

project "ProgramOptionsExample"
	kind "ConsoleApp"
	language "C++"
	targetname "options"
	files { "examples/options_description.cpp" }
	links { "BoostProgramOptions" }

project "SharedPointerExample"
	kind "ConsoleApp"
	language "C++"
	targetname "shared_ptr"
	files { "examples/shared_ptr_example2*.cpp" }
	links { "BoostProgramOptions" }

