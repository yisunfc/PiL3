#include <errno.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"

static int fil(lua_State* L)
{
	luaL_checktype(L, 1, LUA_TTABLE);
	luaL_checktype(L, 2, LUA_TFUNCTION);

	lua_newtable(L);
	int n = luaL_len(L, 1);
	int count = 1;
	for (int i = 1; i <= n; ++i)
	{
		lua_pushvalue(L, 2);
		lua_rawgeti(L, 1, i);
		lua_call(L, 1, 1);
		int ret = lua_toboolean(L, -1);
		lua_pop(L, 1);
		if (ret)
		{
			lua_rawseti(L, 3, count++);
		}
	}
	return 1;
}
static const struct luaL_Reg mylib [] = 
{
	{"filter", fil},
	{NULL, NULL},
};

int luaopen_mylib(lua_State* L)
{
	luaL_newlib(L, mylib);
	return 1;
}
