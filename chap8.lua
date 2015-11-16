--8.1 Compilation
--loadfile从文件中载入chunk但不运行,只把编译的块作为函数返回
--loadfile不抛出错误,只返回错误码。dofile会在遇到错误时抛出错误
--如果需要多次运行一个文件,应该调用loadfile,只编译文件一次
--load从字符串里读取快并编译
f = load("local a = 10; print(a + 20)")
f()
s="11+22"
f = load("return "..s)
print(f())
--load一个块只会返回匿名函数，和定义函数不同：一个在编译器，一个在运行期

--8.2 Precompiled Code
--使用luac创建一个预编译的二进制lua模块的方法:
--$luac -o prog.lc prog.lua
--$lua prog.lc 运行方法和文本文件一样
--loadfile和load都接受预编译过的代码
--使用luac -l 可以查看编译的代码

--8.3 C Code
--加载一个动态库的常用做法:
--local path="/usr/local/lib/lua/5.1/socket.so"
--local f=package.loadlib(path, "luaopen_socket")

--8.4 Errors
--assert的用法示例:
--print("enter a number")
--n = assert(io.read("*n"), "invalid input")

--8.5 Error Handling and Exceptions
--pcall(protected call)在保护模式下执行参数代码,成功执行返回true,失败则返回false,第二个返回值为错误码
local ok,err=pcall(function() a="a"+1 end)
print(err)
--8.6 Error Messages and Tracebacks
--error函数可以传递第二个参数,值为1时只打印当前调用函数，为2时可以显示调用堆栈
function foo(str)
	if type(str)~="string" then
		error("string expected!", 2)
	end
	print(str)
end
local function t1(str)
	return	foo(str)
end
function t2()
	print("input!")
	t1(123)
end
t2()
--pcall会在出错时销毁堆栈，xpcall函数接受第二个参数作为消息处理函数，在出错之后堆栈销毁前会先调用该参数
