solution "SimpleFunctionLibrary"
	configurations {"Release", "Debug"}
	objdir "build"
	platforms { "x32", "x64" }
    targetdir "bin"
	
	configuration "Release"
		flags { "Optimize" }
		
	configuration "Debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
        
project "libsfl"
	kind "StaticLib"
	language "C"
	files { "sflsrc21/sfl*.c" }
	excludes { "sflsrc21/sflsock.c" }
	targetname "sfl"
    
project "DirTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/testdir.c" }
    links { "libsfl" }
    
project "MemTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/testmem.c" }
    links { "libsfl" }
    
project "StringTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/teststr.c" }
    links { "libsfl" }
    
project "DateTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/testdate.c" }
    links { "libsfl" }
    
project "BitTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/testbits.c" }
    links { "libsfl" }
    
project "CryptTest"
    kind "ConsoleApp"
    language "C"
    files { "sflsrc21/testcryp.c" }
    links { "libsfl" }