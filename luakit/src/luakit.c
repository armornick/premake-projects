
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#ifdef __cplusplus
}
#endif

#include "FileIO.h"


#define MAINFILE "main.lua"


int main (int argc, char *argv[]) {
	/* variable declarations */
	int i = 0; /* loop counter */
	
	/* initialize lua */
	lua_State * L = luaL_newstate();
	if (! L) { 
		error(L, 1, "Failed creating Lua state.\n"); 
	}
	luaL_openlibs(L);	/* load Lua base libraries */
	FS_Init(L, argv);	/* initialize virtual filesystem */
	
	/* register Lua functions */
	luaopen_fileio(L, "physfs");
	
	/* add arg table */
	lua_newtable(L);
	for (i=0; i < argc; i++) {
		lua_pushstring(L, argv[i]);
		lua_rawseti(L, -2, i);
	}
	lua_setglobal(L, "arg");
	
	/* load main lua file */
	if (FS_loadFile(L, MAINFILE) == FILEIO_ERROR) {
		error(L, 1, "Error loading '%s':\n\t%s", MAINFILE, lua_tostring(L, -1));
	}
	
	/* run the compiled chunk */
	if (lua_pcall(L, 0, 0, 0) != 0) {
		error(L, 1, "Error running '%s':\n\t%s", MAINFILE, lua_tostring(L, -1));
	}
	
	lua_close(L);
	return 0;
}