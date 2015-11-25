--25.2 The Stack
--lua用lua_push*一系列API来往stack中压入数据
--包括nil boolean number integer unsigned lstring string等
--lua会对每一个压入栈的string保存其拷贝,所以不需要在c中保存该string的buffer等数据
--在push元素到stack中之前必须保证栈有空间,可以实用lua_checkstack来检查
--stack元素可以用下标访问,1表示第一个压入的元素,2是第二个,-1表示最后一个压入也就是栈顶的元素,-2表示倒数第二个
--lua_tostring(L, -1)是将栈顶元素作为sring返回
--lua_is*可以检查stack中元素是否指定的类型
--lua_type返回stack中指定位置的元素的类型
--lua_to*可以将元素转换为指定类型,如果类型不符合也会返回对应的零值(0, NULL等)
--
--当lua调用的C函数返回时,lua会清空栈,所以不要获得lua string指针的函数外保存该指针

--lua_gettop 返回栈元素个数,也就是栈顶元素的index
--lua_settop 设置栈元素个数,如果原有top index比现在的值大,多出来的会被抛弃;相反的,在新的空里填入nil
--example : lua_settop(L, 0) clear the stack

--25.3 Error Handling with the C API

--Exercise 25.2
--"hello", "hello", nil (top)
