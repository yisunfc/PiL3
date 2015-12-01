#include <errno.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"

static void stackDump(lua_State *L)
{
	int i;
	int top = lua_gettop(L);
	printf("stack size=%d\n", top);
	for (i = 1; i <= top; i++)
	{
		int t = lua_type(L, i);
		switch(t)
		{
			case LUA_TSTRING:
				{
					printf("'%s'", lua_tostring(L, i));
				}
				break;
			case LUA_TBOOLEAN:
				{
					printf(lua_toboolean(L, i) ? "true" : "false");
				}
				break;
			case LUA_TNUMBER:
				{
					printf("%g", lua_tonumber(L, i));
				}
				break;
			default:
				{
					printf("%s", lua_typename(L, t));
				}
				break;
		}
		printf(" ");
	}
	printf("\n");
}
#define SD() stackDump(L)

static int fil(lua_State* L)
{
	luaL_checktype(L, 1, LUA_TTABLE);
	luaL_checktype(L, 2, LUA_TFUNCTION);

	lua_newtable(L);
	int n = luaL_len(L, 1);
	int count = 1;
	int i = 1;
	for (; i <= n; ++i)
	{
		lua_pushvalue(L, 2);
		lua_rawgeti(L, 1, i);
		double num = lua_tonumber(L, -1);
		lua_call(L, 1, 1);
		int ret = lua_toboolean(L, -1);
		lua_pop(L, 1);
		if (ret)
		{
			lua_pushnumber(L, num);
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
