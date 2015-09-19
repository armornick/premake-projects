function make_pathlist (dir, files)
	local result = {}

	for i = 1, #files do
		result[i] = path.join(dir, files[i])
	end

	return result
end

-- Main project container
solution "SeveralLibraries"
	targetdir "build"
	configurations {'release'}

	configuration 'release'
		flags {'Optimize'}

	-- constants
	local FS_DIR = 'fs.c-0.1.2'
	local FILE2STR_DIR = 'file2str-master'
	local SQLITE_DIR = 'sqlite-amalgamation-3081101'
	local BSTR_DIR = 'bstrlib-master'
	local DUKTAPE_DIR = 'duktape-1.3.0'
	local PCRE_DIR = 'pcre2-10.20'
	local REGEX_DIR = 'regex-master'

	-- fs.c (https://github.com/jwerle/fs.c)
	project "fs"
		kind "StaticLib"
		language "C"

		includedirs { FS_DIR }
		files { path.join(FS_DIR, 'fs.c') }

	-- file2str (https://github.com/willemt/file2str)
	project "file2str"
		kind "StaticLib"
		language "C"

		includedirs { FILE2STR_DIR }

		files { path.join(FILE2STR_DIR, 'file2str.c') }

	-- http://bstring.sourceforge.net/
	project "bstr"
		kind "StaticLib"
		language "C"

		includedirs { BSTR_DIR }

		files { path.join(BSTR_DIR, 'bstrlib.c') }

	-----------------------------------------------------------------------------
	--- SQLITE3 EMBEDDED DATABASE
	-----------------------------------------------------------------------------
	-- https://www.sqlite.org/
	project "sqlite3"
		kind "StaticLib"
		language "C"

		includedirs { SQLITE_DIR }

		files { path.join(SQLITE_DIR, 'sqlite3.c') }

	-- https://www.sqlite.org/
	project "sqlite3-shell"
		kind "ConsoleApp"
		language "C"
		targetname "sqlite3"

		includedirs { SQLITE_DIR }

		files { path.join(SQLITE_DIR, 'shell.c') }
		links { 'sqlite3' }

	-----------------------------------------------------------------------------
	--- DUKTAPE JAVASCRIPT INTERPRETER
	-----------------------------------------------------------------------------

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

	-----------------------------------------------------------------------------
	--- PCRE2 REGULAR EXPRESSIONS
	-----------------------------------------------------------------------------

	project "pcre2"
		kind "StaticLib"
		language "C"

		defines { 'PCRE2_CODE_UNIT_WIDTH=8','HAVE_CONFIG_H' }
		includedirs { path.join(PCRE_DIR, 'src') }

		local pcre_files = { 'pcre2_auto_possess.c', 'pcre2_chartables.c', 'pcre2_compile.c', 'pcre2_config.c', 'pcre2_context.c',
			'pcre2_dfa_match.c', 'pcre2_error.c', 'pcre2_jit_compile.c', 'pcre2_maketables.c', 	'pcre2_match.c',
			'pcre2_match_data.c', 'pcre2_newline.c', 'pcre2_ord2utf.c', 'pcre2_pattern_info.c', 'pcre2_serialize.c',
			'pcre2_string_utils.c', 'pcre2_study.c', 'pcre2_substitute.c', 'pcre2_substring.c', 'pcre2_tables.c',
			'pcre2_ucd.c', 'pcre2_valid_utf.c', 'pcre2_xclass.c'
		}
		files(make_pathlist(path.join(PCRE_DIR, 'src'), pcre_files))

	project "pcre2posix"
		kind "StaticLib"
		language "C"

		defines { 'PCRE2_CODE_UNIT_WIDTH=8','HAVE_CONFIG_H' }
		includedirs { path.join(PCRE_DIR, 'src') }
		files { path.join(PCRE_DIR, 'src', 'pcre2posix.c') }

	project "pcre2test"
		kind "ConsoleApp"
		language "C"

		defines { 'HAVE_CONFIG_H' }
		includedirs { path.join(PCRE_DIR, 'src') }
		files { path.join(PCRE_DIR, 'src', 'pcre2test.c') }
		links { 'pcre2','pcre2posix' }

	project "pcre2grep"
		kind "ConsoleApp"
		language "C"

		defines { 'HAVE_CONFIG_H' }
		includedirs { path.join(PCRE_DIR, 'src') }
		files { path.join(PCRE_DIR, 'src', 'pcre2grep.c') }
		links { 'pcre2' }

	
