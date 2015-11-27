--26.2 Table Manipulation
--lua_gettable接受栈中指定位置的表,pop它的key,push进key对应的value
--lua_getfield(L, -1, key)相当于
--lua_pushstring(L, key) lua_gettable(L, -2)
--lua_settable接受一个index来设置该位置的table,pop出其key和value
--lua_setfiled(L, -3, key) 相当于
--lua_pushstring(L, key) lua_push*(L, value) lua_settable(L, -3)
--需要注意的是,setfiled和getfield的key都需要是string
--
--lua_newtable创建新的空表并压入栈
--lua_setglobal(L, value)将栈顶元素pop并用value来给其命名


--26.3 Calling Lua Functions
--lua_pcall的第2个参数是传给lua函数的参数个数,第3个参数是lua函数返回的个数
--在将返回值压入stack之前,lua会将调用函数和参数从栈中弹出
--如果执行出错,lua会返回错误码,并将错误信息压入栈,在压入之前还会调用传给lua_pcall的第4个参数(一个错误处理函数)
--对于一般错误,lua_pcall返回LUA_ERRRUN的错误码,有两种情况有不同的错误码,因为他们不会调用message handler.
--第一种是内存分配错误,返回LUA_ERRMEM.
--第二种是执行message handler时的错误,返回LUA_ERRERR
--在5.2中有了第三种,如果在回收资源时出错,返回LUA_ERRGCMM

--26.4 A Generic Call Function
