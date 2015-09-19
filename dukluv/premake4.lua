-- Main project container
solution "PremakeDukluv"
	targetdir "build"
	configurations {'release'}

	configuration 'release'
		flags {'Optimize'}

	-- constants
	local UV_DIR = 'libuv-1.6.1'
	local DUKTAPE_DIR = 'duktape-1.2.2'
	local DUKLUV_DIR = 'dukluv-master'

	-- http://duktape.org/
	project "duktape"
		kind "StaticLib"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src') }

		files { path.join(DUKTAPE_DIR, 'src', 'duktape.c') }

	-- hello world duktape example (http://duktape.org/)
	project "duktape-hello"
		kind "ConsoleApp"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src') }

		files { path.join(DUKTAPE_DIR, 'examples', 'hello', 'hello.c') }
		links { "duktape" }

	project "duk"
		kind "ConsoleApp"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src') }

		files { path.join(DUKTAPE_DIR, 'examples', 'cmdline', 'duk_cmdline.c') }
		links { "duktape" }

	-- libuv (https://github.com/libuv/libuv)
	project "uv"
		kind "StaticLib"
		language "C"

		includedirs { path.join(UV_DIR, 'include'), path.join(UV_DIR, 'src') }

		files { path.join(UV_DIR, 'src', '*') }

		configuration "windows"
			defines { 'WIN32_LEAN_AND_MEAN', '_WIN32_WINNT=0x0600' }
			files { path.join(UV_DIR, 'src', 'win', '*') }
			-- requires: 'ws2_32','shell32','psapi','iphlpapi','advapi32'

	-- http://dukluv.io/
	project "duv"
		kind "StaticLib"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src'), path.join(UV_DIR, 'include') }

		function duv_files ()
			local files = { "duv.c", "refs.c", "utils.c", "loop.c", "req.c", "handle.c", 
				"timer.c", "stream.c", "tcp.c", "pipe.c", "tty.c", "fs.c", "misc.c",
				"utils.c", "uv_schema.c", "callbacks.c" }
			local result = {}

			for i = 1, #files do
				result[#result+1] = path.join(DUKLUV_DIR, 'src', files[i])
			end

			return result
		end

		files(duv_files())

	-- http://dukluv.io/
	project "dschema"
		kind "StaticLib"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src') }

		files { path.join(DUKLUV_DIR, 'src', 'schema.c') }

	-- http://dukluv.io/
	project "dukluv"
		kind "ConsoleApp"
		language "C"

		includedirs { path.join(DUKTAPE_DIR, 'src'), path.join(UV_DIR, 'include') }

		files { path.join(DUKLUV_DIR, 'src', 'main.c') }
		links { 'duv', 'dschema', 'duktape', 'uv', 'ws2_32','shell32','psapi','iphlpapi','advapi32','userenv' }