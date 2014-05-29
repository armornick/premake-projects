local BOOST_DIR = 'boost_1_54_0'

local INCDIR = BOOST_DIR
local LIBDIR = BOOST_DIR .. '/libs'

solution "Boost"
	configurations { "Release", "Debug" }
	flags { "StaticRuntime" }
	platforms { "x32", "x64" }
	-- setup directories
	location "build"
	targetdir "bin"
	includedirs {INCDIR}
		
	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }
	
	configuration {"windows", "gmake"}
		linkoptions {"-static-libgcc", "-static-libstdc++"}

local BOOST_REGEX = LIBDIR .. '/regex'

project "BoostRegex"
	kind "StaticLib"
	language "C++"
	targetname "boost_regex"
	files { BOOST_REGEX.."/src/*.cpp" }

project "RegexExample"
	kind "ConsoleApp"
	language "C++"
	targetname "grep"
	files { BOOST_REGEX.."/example/grep/*.cpp" }
	links { "BoostRegex", "BoostProgramOptions" }

project "RegexExample2"
	kind "ConsoleApp"
	language "C++"
	targetname "split"
	files { BOOST_REGEX.."/example/snippets/regex_split_example_1.cpp" }
	links { "BoostRegex" }
	

	
local BOOST_SYSTEM = LIBDIR .. '/system'
local BOOST_FILESYSTEM = LIBDIR .. '/filesystem'
	
project "BoostFilesystem"
	kind "StaticLib"
	language "C++"
	targetname "boost_filesystem"
	defines { "BOOST_FILESYSTEM_STATIC_LINK=1" }
	files { BOOST_SYSTEM..'/src/*.cpp', BOOST_FILESYSTEM.."/src/*.cpp" }

project "FilesystemExample"
	kind "ConsoleApp"
	language "C++"
	targetname "ls"
	files { BOOST_FILESYSTEM.."/example/simple_ls.cpp" }
	links { "BoostFilesystem" }

project "FilesystemExample2"
	kind "ConsoleApp"
	language "C++"
	targetname "file_size"
	files { BOOST_FILESYSTEM.."/example/file_size.cpp" }
	links { "BoostFilesystem" }

local BOOST_PROGRAM_OPTIONS = LIBDIR .. '/program_options'

project "BoostProgramOptions"
	kind "StaticLib"
	language "C++"
	targetname "boost_program_options"
	files { BOOST_PROGRAM_OPTIONS.."/src/*.cpp" }

project "ProgramOptionsExample"
	kind "ConsoleApp"
	language "C++"
	targetname "options"
	files { BOOST_PROGRAM_OPTIONS.."/example/options_description.cpp" }
	links { "BoostProgramOptions" }

local BOOST_SMART_PTR = LIBDIR .. '/smart_ptr'

project "SharedPointerExample"
	kind "ConsoleApp"
	language "C++"
	targetname "shared_ptr"
	files { BOOST_SMART_PTR.."/example/shared_ptr_example2*.cpp" }
	links { "BoostProgramOptions" }

