#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static void stackDump(lua_State *L)
{
	int i;
	int top = lua_gettop(L);
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

void test_stack()
{
	lua_State *L = luaL_newstate();

	lua_pushnumber(L, 3.5);
	stackDump(L);
	lua_pushstring(L, "hello");
	stackDump(L);
	lua_pushnil(L);
	stackDump(L);
	lua_pushvalue(L, -2);
	stackDump(L);
	lua_remove(L, 1);
	stackDump(L);
	lua_insert(L, -2);

	stackDump(L);

	lua_close(L);
}
void run_interpreter()
{
	char buff[256];
	int error;
	lua_State* L = luaL_newstate();
	luaL_openlibs(L);

	while (fgets(buff, sizeof(buff), stdin) != NULL)
	{
		error = luaL_loadstring(L, buff) || lua_pcall(L, 0, 0, 0);
		if (error)
		{
			fprintf(stderr, "%s\n", lua_tostring(L, -1));
			lua_pop(L, 1);
		}
	}
}

int main()
{
	test_stack();
	return 0;
}
