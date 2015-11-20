--require创建并返回对应模块的一张表
--15.1 The require Function
--如果一个模块已经被加载，再次require它只会返回相同的值
--如果模块未被加载，则寻找同名lua文件，找到就实用loadfile来加载
--如果没有对应的lua文件，会找对应c文件，找到后寻找调用luaopen_modname的函数,然后用package.loadlib加载
--如果要强制加载某个模块2次，可以这么做:
--package.loaded.<modname>=nil

--15.2 The Basic Approach for Writing Modules in Lua
--最好是在一个模块的最后实用return语句

--15.3 Using Environments
--可以用下面的方法避免全局污染
--local M={}
--
--local sqrt= math.sqrt
--local io=io
--
--_ENV=nil -- or _ENV=M


--15.4 Submodules and Packages
--加载a.b模块时查找的文件是
--/somepath/a/b.lua

--下面是一个演示用相对路径来加载模块的方法
------------------------------------------------
package.path = package.path..";../modules/?.lua"
require("test")

local t = test
print(t.test("dwdw"))
print(t.test({}))
------------------------------------------------
