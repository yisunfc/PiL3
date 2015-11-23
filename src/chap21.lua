--22.1 The Simple I/O Model
--可以用io.input和io.output来改变当前io流操作的文件
--io.input(filename)用输入方式打开filename的文件并将其设置为当前输入文件
io.input("chap1.lua")
local i = io.read()
while i do
	print(i)
	i = io.read()
end
--尽量避免使用io.write(a..b..c)，而是用io.write(a,b,c)
--io.read参数选项：
--"*a" reads the whole file
--"*l" reads the next line(without newline) ,default value for io.read
--"*L" reads the next line(with newline)
--"*n" reads a number
--"num" reads a string with up to num characters
--io.lines()可以迭代的读取文件

--22.2 The Complete I/O Model
--io.open模仿了C里的fopen函数,参数选项也一致
local filename = arg[0] 
local file = assert(io.open(filename, "r"))
local t = file:read("*a")
file:close()
print(string.format("===========we are about to print %s now!!!======", filename))
print(t)
--io.stdin, io.stdout, is.stderr是预定义的C流，可以直接使用

--22.3 Other Operations On Files
--file:seek(whence, offset)和c语言里一样 
