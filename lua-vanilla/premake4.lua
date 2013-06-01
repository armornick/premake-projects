---
-- configuaration
---
local lua51dir = "lua-5.1.5"
local lua52dir = "lua-5.2.2"
local defaultver = "51"
-- link lua.exe dynamically?
local Dynamic = false


solution "Lua"
	configurations {"Release", "Debug"}
	objdir "build"
	platforms { "x32", "x64" }
	
	configuration "Release"
		targetdir "bin"
		flags { "Optimize" }
		
	configuration "Debug"
		targetdir "bin/debug"
		flags { "Symbols" }
		defines {"_DEBUG", "DEBUG"}
		
function make_lua(ver, dir, dynamic)
        
project("StaticLua" .. ver)
	kind "StaticLib"
	language "C"
	files { dir.."/src/*.c" }
	excludes { dir.."/src/lua.c", dir.."/src/luac.c", dir.."/src/print.c" }
	targetname("lua"..ver)

project("DynamicLua"..ver)
	kind "SharedLib"
	language "C"
	files { dir.."/src/*.c" }
	excludes { dir.."/src/lua.c", dir.."/src/luac.c", dir.."/src/print.c" }
	defines { "LUA_BUILD_AS_DLL" }
	targetname("lua"..ver)
    implibname ("lua"..ver.."dll")
	

    
project("Lua".. ver)
	kind "ConsoleApp"
	language "C"
	files { dir.."/src/lua.c" }
	libdirs { "bin" }
if dynamic then
    links { "DynamicLua"..ver }
else 
    links { "StaticLua"..ver }
end
	targetname("lua"..ver)
    

project("Luac".. ver)
	kind "ConsoleApp"
	language "C"
	files { dir.."/src/luac.c", os.isfile(dir.."/src/print.c") and dir.."/src/print.c" }
	libdirs { "bin" }
	links { "StaticLua" .. ver }
	targetname("luac"..ver)

end

function lua_module(name, dir, ver, extralinks)
ver = ver or defaultver

project(name)
	kind "SharedLib"
	language "C"
	files { dir.."/*.c" }
    
local ldflags = { "DynamicLua"..ver }
if extralinks then
    for k, v in ipairs(extralinks) do
        table.insert(ldflags, v)
    end
end
    links(ldflags)

end

---
-- Lua distributions
---
make_lua("51", lua51dir, Dynamic)
make_lua("52", lua52dir, Dynamic)

---
-- Lua modules
---
lua_module("lfs", "luafilesystem-master/src")
lua_module("lpeg", "lpeg-master")