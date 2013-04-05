/*
** $Id: FileIO.c 52 2009-05-08 22:09:45Z basique $
** File I/O: Access to the virtual file system
Copied from Scrupp: Copyright (c) 2005-2009 Andreas Krinke (MIT license)
Modified by armornick (2013-04-04) under MIT license
*/

#include "FileIO.h"

#include <luaconf.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <physfs.h>

#define LVFS_PATH		"?.lua;?/init.lua;scripts/?.lua;scripts/?/init.lua"

void error (lua_State *L, int fatal, const char *fmt, ...) {
	char str[1024];
	const char *msg;
	
	va_list argp;
	va_start(argp, fmt);
	vsnprintf(str, 1023, fmt, argp);
	va_end(argp);
	
	msg = luaL_gsub(L, str, "[\"", "'");
	msg = luaL_gsub(L, msg, "[string \"", "'");
	msg = luaL_gsub(L, msg, "\"]", "'");
	fputs(msg, stderr);

	fputs("\n", stderr);
	if (fatal) {
		lua_close(L);
		exit(1);
	}
}

/* copied from lua.c of the Lua distribution */
static const char *pushnexttemplate (lua_State *L, const char *path) {
	const char *l;
	while (*path == *LUA_PATHSEP) path++;  /* skip separators */
	if (*path == '\0') 
		return NULL;  /* no more templates */
	l = strchr(path, *LUA_PATHSEP);  /* find next separator */
	if (l == NULL) 
		l = path + strlen(path);
	lua_pushlstring(L, path, l - path);  /* template */
	return l;
}

/* based on code from lua.c of the Lua distribution */
static const char *findfile (lua_State *L, const char *name) {
	const char *path;
	name = luaL_gsub(L, name, ".", "/");
	lua_getglobal(L, "package");
	lua_getfield(L, -1, "vfspath");
	path = lua_tostring(L, -1);
	if (path == NULL)
		luaL_error(L, LUA_QL("package.vfspath") " must be a string");
	lua_pushstring(L, "");  /* error accumulator */
	while ((path = pushnexttemplate(L, path)) != NULL) {
		const char *filename;
		filename = luaL_gsub(L, lua_tostring(L, -1), LUA_PATH_MARK, name);
		if (PHYSFS_exists(filename))  /* does file exist? */
			return filename;  /* return that file name */
		lua_pop(L, 2);  /* remove path template and file name */ 
		lua_pushfstring(L, "\n\tno file " LUA_QL("searchpath://%s") , filename);
		lua_concat(L, 2);
	}
	return NULL;  /* not found */
}


/* A loader which looks for modules in the physfs virtual filesystem */
/* based on code from lua.c of the Lua distribution */
static int loader_PhysFS(lua_State *L) {
	const char *filename;
	const char *name = luaL_checkstring(L, 1);
	int result;
	filename = findfile(L, name);
	if (filename == NULL) {
		return 1; /* library not found in this path */
	}
	result = FS_loadFile(L, filename);
	if (result == FILEIO_ERROR) {
		return luaL_error(L, 	"error loading module " LUA_QS " from file " 
								LUA_QL("searchpath://%s") ":\n\t%s",
								lua_tostring(L, 1), filename, lua_tostring(L, -1));
	}
	return 1; /* library loaded successfully */
}
	
static void FS_Quit(void) {
#ifdef DEBUG
	fprintf(stdout,"Running FS_Quit.\n");
#endif
	PHYSFS_deinit();
}

/* extracts the dirname and the basename from the path */
static void splitPath(const char *path, char **dir, char **base) {
	char *ptr;
	const char *dirsep = NULL;
	*base = (char *)path;
	*dir = (char *)".";
	dirsep = PHYSFS_getDirSeparator();
	if (strlen(dirsep) == 1) { /* fast path. */
		ptr = strrchr(path, *dirsep);
	}
	else {
		ptr = strstr(path, dirsep);
		if (ptr != NULL) {
			char *p = ptr;
			while (p != NULL) {
				ptr = p;
				p = strstr(p + 1, dirsep);
			}
		}
	}
	if (ptr != NULL) {
		size_t size = (size_t) (ptr - path);
		*dir = (char *) malloc(size + 1);
		memcpy(*dir, path, size);
		(*dir)[size] = '\0';
		*base = ptr + strlen(dirsep);
	}
}

void FS_Init(lua_State *L, char *argv[]) {
	char **copy;
	
	/* initialize PhysFS */
	if (PHYSFS_init(argv[0]) ==0) {
		error(L, 1,  "Error: Could not initialize PhysFS: %s.", PHYSFS_getLastError());
	}
	
	/* allow symlinks */
	PHYSFS_permitSymbolicLinks(1);
	
	/* prepend base dir to search path */
	if (PHYSFS_addToSearchPath(PHYSFS_getBaseDir(), 0) == 0) {
		error(L, 0, "Error: Could not add base dir to search path: %s.", PHYSFS_getLastError());
	}
	
	/* prepend executable to search path */
	if (PHYSFS_addToSearchPath(argv[0], 0) == 0) {
		error(L, 0, "Error: Could not add base dir to search path: %s.", PHYSFS_getLastError());
	}
	
	atexit(FS_Quit);

#ifdef DEBUG
	char **search_path = NULL;
	search_path = PHYSFS_getSearchPath();
	copy = search_path;
	while (*copy != NULL) {
		printf("search path: %s\n", *copy++);
	}
	PHYSFS_freeList(search_path);
#endif
}

int FS_loadFile(lua_State *L, const char *filename) {
	char *buffer;		/* buffer for the file */
	char *entryPoint;	/* entry point of file (differs from buffer, if "#!" in the first line is skipped */
	int err;
	PHYSFS_file *Hndfile = NULL;
	PHYSFS_sint64 fileLength, size;
	
	if (PHYSFS_exists(filename) == 0) {
		lua_pushfstring(L, "Error loading '%s': file not found.", filename);
		return FILEIO_ERROR;
	}

	Hndfile = PHYSFS_openRead(filename); /* open file to read! */
	if (Hndfile == NULL) {
		lua_pushfstring(L, "Error while reading from '%s': %s", filename, PHYSFS_getLastError());
		return FILEIO_ERROR;
	}

	size = PHYSFS_fileLength(Hndfile);
	if (size == -1) {
		lua_pushfstring(L, "Error while determining the size of %s.", filename);
		return FILEIO_ERROR;
	}

	buffer = (char *)malloc((unsigned int)size);
	if (buffer == NULL) {
		lua_pushfstring(L, "Error loading %s: Insufficient memory available.", filename);
		return FILEIO_ERROR;
	}

	fileLength = PHYSFS_read(Hndfile, buffer, 1, (unsigned int)size);
	if (fileLength < size) {
		free(buffer);
		lua_pushfstring(L, "Error while reading from %s: %s", filename, PHYSFS_getLastError());
		return FILEIO_ERROR;
	}
	/* close the file */
	err = PHYSFS_close(Hndfile);
	if (err == 0) {
		free(buffer);
		lua_pushfstring(L, "Error closing %s: %s", filename, PHYSFS_getLastError());
		return FILEIO_ERROR;
	}
	/* skip #! if nescessary */
	entryPoint = buffer;
	if (buffer[0] == '#') {
		while ((*entryPoint != 0x0D) && (*entryPoint != 0x0A) && (*entryPoint != EOF)) {
			entryPoint++;
			fileLength--;
		}
	}
	err = luaL_loadbuffer(L, entryPoint, (size_t)fileLength, filename);
	free(buffer);	
	if (err != 0) {
		/* error message is on the stack */
		return FILEIO_ERROR;
	}
	
	return FILEIO_SUCCESS;
}

static int Lua_FS_dofile(lua_State *L) {
	const char *filename = luaL_optstring(L, 1, NULL);
	int n = lua_gettop(L);
	if (PHYSFS_exists(filename)) {
		if (FS_loadFile(L, filename) == FILEIO_ERROR) {
			return lua_error(L);
		}
	} else if (luaL_loadfile(L, filename) != 0) {
		return lua_error(L);
	}
	lua_call(L, 0, LUA_MULTRET);
	return lua_gettop(L) - n;
}

static int Lua_FS_fileExists(lua_State *L) {
	const char *filename = luaL_checkstring(L, 1);
	lua_pushboolean(L, PHYSFS_exists(filename));
	
	return 1;
}

static int Lua_FS_isDirectory(lua_State *L) {
	const char *filename = luaL_checkstring(L, 1);
	lua_pushboolean(L, PHYSFS_isDirectory(filename));
	
	return 1;
}

static int Lua_FS_isSymbolicLink(lua_State *L) {
	const char *filename = luaL_checkstring(L, 1);
	lua_pushboolean(L, PHYSFS_isSymbolicLink(filename));
	
	return 1;
}

static int Lua_FS_getSearchPath(lua_State *L) {
	char **search_path = PHYSFS_getSearchPath();
	char **copy = search_path;
	int n = 1;
	lua_newtable(L);
	while (*copy != NULL) {
		lua_pushstring(L, *copy++);
		lua_rawseti(L, -2, n++);
	}
	PHYSFS_freeList(search_path);
	
	return 1;
}

static int Lua_FS_setSearchPath(lua_State *L) {
	const char *str;
	char **search_path = PHYSFS_getSearchPath();
	char **copy = search_path;
	int n, maxn;

	luaL_checktype(L, 1, LUA_TTABLE);

	/* clear the search path */
	while (*copy != NULL) {
		PHYSFS_removeFromSearchPath(*copy++);
	}
	
	PHYSFS_freeList(search_path);
	maxn = lua_objlen(L, 1);
	for (n = 1; n <= maxn; n++) {
		lua_pushinteger(L, n);
		lua_gettable(L, -2);
		str = lua_tostring(L, -1);
		if (PHYSFS_addToSearchPath(str, 1) == 0) {
			return luaL_error(L,	"Error: Could not add directory or archive '%s' "
									"to search path: %s", str, PHYSFS_getLastError());
		}
		/* remove the string */
		lua_pop(L, 1);
	}

	return 0;
}

static const struct luaL_Reg fileiolib[] = {
	{"fileExists", Lua_FS_fileExists},
	{"isDirectory", Lua_FS_isDirectory},
	{"isSymbolicLink", Lua_FS_isSymbolicLink},
	{"getSearchPath", Lua_FS_getSearchPath},
	{"setSearchPath", Lua_FS_setSearchPath},
	{NULL, NULL}
};

int luaopen_fileio(lua_State *L, const char *parent) {
	luaL_register(L, parent, fileiolib);
	
	lua_pushcfunction(L, Lua_FS_dofile);
	lua_setglobal(L, "dofile");
	
	/* insert the custom PhysFS loader into the loaders table */
	lua_getglobal(L, "table");
	lua_getfield(L, -1, "insert");
	lua_remove(L, -2);
	lua_getglobal(L, "package");
	lua_getfield(L, -1, "loaders");
	lua_remove(L, -2);
	lua_pushinteger(L, 2);
	lua_pushcfunction(L, loader_PhysFS);
	lua_call(L, 3, 0);
	
	/* set field `package.vfspath' */
	lua_getglobal(L, "package");	
	lua_pushstring(L, LVFS_PATH);
	lua_setfield(L, -2, "vfspath");
	lua_remove(L, -1);
	
	return 1;
}
