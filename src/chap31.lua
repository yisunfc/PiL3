--31.1 Multiple Threads
--lua_State *lua_newthread(lua_State *L);
--lua中的thread类型拥有自己独立的stack,但是实际上和创建它的state是同一个物理线程


--31.2 Lua States
--不同state之间交互只能通过c,所以number或string之外的类型无法直接交互,需要序列化
