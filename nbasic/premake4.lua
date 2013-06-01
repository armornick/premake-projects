
local waxeye = "waxeye-0.8.0\\waxeye"
local grammar = "nbasic.waxeye"
local testfile = "test.bas"

-- A solution contains projects, and defines the available configurations
solution "BASIC Parser"
	configurations { "Debug", "Release" }
	flags { "StaticRuntime" }
	includedirs { "waxeye-0.8.0/src/c/include" }
	libdirs { "waxeye-0.8.0/lib/" }
	links { "waxeye" }
	targetdir "bin"

	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }

project "PureC"
	kind "ConsoleApp"
	language "C"
	targetname "nbasic"
	files { "src/main.c", "src/parser.c", "src/workers.c" }

newaction {
   trigger     = "parser",
   description = "Generate the waxeye parser",
   execute     = function ()
	  os.execute(waxeye .. " -g c src " .. grammar)
   end
}

newaction {
   trigger     = "test",
   description = "test the grammar file",
   execute     = function ()
	  os.execute(waxeye .. " -i " .. grammar .. " < " .. testfile)
   end
}
