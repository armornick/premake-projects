/*
** $Id: FileIO.h 45 2009-03-06 23:45:34Z basique $
** File I/O: Access to the virtual file system
** See Copyright Notice in COPYRIGHT
*/

#ifndef __FILEIO_H__
#define __FILEIO_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#ifdef __cplusplus
}
#endif


#define FILEIO_SUCCESS 0
#define FILEIO_ERROR 1

void error (lua_State *L, int fatal, const char *fmt, ...);

void FS_Init(lua_State *L, char *argv[]);
int FS_loadFile(lua_State *L, const char *filename);

int luaopen_fileio(lua_State *L, const char *parent);

#endif /* __FILEIO_H__ */
