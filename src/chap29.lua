--29.1 Userdata
--lua_newuserdata 分配一块指定的内存,将指定结构的数据压入栈,返回块指针

--29.2 Metatables
--为了数据类型的安全,需要为userdata类型设置metatable,在修改或者获取时也要检查其metatable
--可以使用唯一的字符串来表示其metatable,并存储在registry中
--int luaL_newmetatable(lua_State *L, const char *name);
--void luaL_getmetatable(lua_State *L, const char *name);
--void *luaL_checkudata(lua_State *L, int index, const char *name);
--
--29.3 Object-Oriented Access

--29.4 Array Access
--
--29.5 Light Userdata
--light userdata是值,不是对象,就是C指针
--使用lua_pushlightuserdata将light userdata压入栈
