--28.1 Array Manipulation
--以下两个函数提供了数列的操作
--void lua_rawgeti(lua_State *L, int index, int key);
--void lua_rawseti(lua_State *L, int index, int key);
--其中index指出table在stack中的位置,key指出元素在table中的位置
--luaL_checktype检查参数是不是给定的type,若不是抛出错误
--lua_len返回栈的长度,等同于#操作符

--28.2 String Manipulation
--如果想传给lua一个string的[i,j]部分内容,可以这么做:
--lua_pushlstring(L, s+i, j-i+1)
--可以用下面的方式往stack中压入一个格式化的字符串:
--const char *lua_pushfstring(lua_State *L, const char *fmt, ...)
--返回值是压入stack的字符串的指针
--luaL_Buffer是一种缓冲类型
--luaL_buffinitsize(L, &b, l)初始化后再调用b相关的api不需要提供L
--luaL_addvalue可以用来往其中添加值
--luaL_pushresult(&b)用来将Buffer b压入stack

--28.3 Storing State in C Functions
--lua函数有2种方法可以存储非局部的数据:全局变量和非全局变量,C API提供两个方法存储非全局变量:registry 和 upvalues.
--registry是仅供C模式访问的全局表,一般用来存储在若干模块之间共享的数据.
--upvalue适合存储对于单个函数或者模块是私有的数据
--registry一般用LUA_REGISTRYINDEX定义的伪下标来定位
--比如要获得registry中key为"key"的值:
--lua_getfield(L, LUA_REGISTRYINDEX, "key");

--千万不要用数字来做registry的key,因为数字是预留给reference system的.
--int r = luaL_ref(L, LUA_REGISTRYINDEX);
--这个调用从栈中弹出一个新的值,并把它保存在与r相关联的registry中
--这样就创建了一个新的引用(reference)
--不能在c中保存lua对象的指针,比如string table等类型的指针,但是可以在c中保存这些对象的引用
--lua_rawgeti(L, LUA_REGISTRYINDEX, r); 把r关联的值压入栈
--lual_unref(L, LUA_REGISTRYINDEX, r); 释放引用及其关联的值
--用luaL_ref创建nil值的引用时,只返回一个常引用LUA_REFNIL
--引用系统定义了LUA_NOREF,与任何其他合法的引用不同值

--可以用static变量的地址来创建registry的key,然后实用lua_pushlightuserdata来将其值压入栈
--lua5.2引入了lua_rawgetp和lua_rawsetp来简化上述的操作


--lua_pushcclosure可以用来创建c的闭包

--Exercise 28.1
local lib = require("mylib")
local t = {1,3.2,30, -4,3.13}
function pred(x)
	return x < 3.14
end
local u = lib.filter(t,pred)
for k,v in ipairs(u) do
	print(v)
end
