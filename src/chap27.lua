--27.1 C Functions
--任何在lua中注册的函数都必须有一样的原型:定义在lua.h中的lua_CFunction
--typedef int (*lua_CFunction) (lua_State* L);
--这些函数都是接受luaState为参数然后返回的是返回值的个数
--可以用下面的方法来quick-and-dirty地将函数注册给lua:
--lua_pushcfunction(L, myfunc);
--lua_getglobal(L, "myfunc");

--27.2 Continuations


--27.3 C Modules
--luaL_newlib宏接受一个不同名字的C函数列表然后将其他们一起注册在一个新表中
--注册C函数到lua中时,可以定义一个luaL_Reg类型的数组,然后将{函数名,函数指针}的数据填入数组
