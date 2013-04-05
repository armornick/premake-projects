#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "physfs.h"

#ifdef __cplusplus
extern "C" {
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#ifdef __cplusplus
}
#endif

#define LUA_MAINFILE "main.lua"

extern int luaopen_physfs(lua_State* L);
static int physfs_loader(lua_State* L);

int main (int argc, char* argv[]) {
	// variable declarations
	int i = 0; // loop counter
	
	// initialize lua
	lua_State * L = luaL_newstate();
	if (! L) { 
		printf("Failed creating Lua state.\n"); 
		return 1;
	}
	// open standard libraries
	luaL_openlibs(L);
	// open the physfs library
	luaopen_physfs(L);
	
	// initialize physfs
	if (!PHYSFS_init(argv[0]))
    {
        printf("PHYSFS_init() failed: %s\n", PHYSFS_getLastError());
        return 1;
    }

	// add current directory to search path
	PHYSFS_addToSearchPath(PHYSFS_getBaseDir(), 0);
	
	// add zeroth or first argument to search path
	int rc = 0;
	rc = PHYSFS_addToSearchPath(argv[0], 0);
	if (!rc)
	{
		printf("Couldn't find self-extract data: %s\n", PHYSFS_getLastError());
		printf("This might mean you didn't append a zipfile to the binary.\n");
		//return 1;
	}
	
	// add arg table
	lua_newtable(L);
	for (i=0; i < argc; i++) {
		lua_pushstring(L, argv[i]);
		lua_rawseti(L, -2, i);
	}
	lua_setglobal(L, "arg");
	
	// load the main lua file
	char *buf;
	if (PHYSFS_exists(LUA_MAINFILE)) {
		PHYSFS_file* lua_main = PHYSFS_openRead(LUA_MAINFILE);
		long filelen = PHYSFS_fileLength(lua_main);
		buf = malloc(filelen+1);
		int length_read = PHYSFS_read (lua_main, buf, 1, filelen);
		buf[filelen] = 0;
		PHYSFS_close(lua_main);
	} else {
		printf("'%s' could not be found.\n", LUA_MAINFILE);
		return 1;
	}
	//printf("readed lua: %s\n", buf);
	if (luaL_dostring(L, buf)) {
		printf("lua error;\n");
		printf("Error: %s\n", lua_tostring(L,-1));
	}
	free(buf);
	
	PHYSFS_deinit();
	lua_close(L);
	return 0;
}

static int physfs_loader(lua_State* L) {
	size_t len;
	const char *filename = luaL_checklstring(L, -1, &len);
	
	
}