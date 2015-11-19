--如果function是一个参数并且参数是字符串或者table的构造函数,调用时可以不带括号
print "hello world" -->hello world
function func(t)
	for k,v in pairs(t) do
		print(k..":"..v)
	end
end
func{x=10, y=20} --> func({x=10, y=20})
--5.1 Multiple Results
--函数调用实参参数个数可以与形参个数不同，调整规则与赋值相同
--对于有多个返回值的函数调用，其值如果不是最后一个参数，则只能保留第一个返回值
--foo0 foo1 foo2 分别为返回0、1、2个值的函数
--x,y,z = foo2() -- x="a", y="b", z=nil
--x,y = foo0(), 20, 30 -- x=nil, y=20, 30 is discarded
--print(foo2(), 1) --> a 1
--可以多加一对()来使多返回值的函数只有一个值被保留
function foo2()
	return 1,2
end
print((foo2())) -->1
--table.unpack是一个特殊的函数,它在做参数的时候将一个table展开
--table.unpack可以用长度操作符来知道要返回几个元素
local tbl1={1,2,3}
print(table.unpack(tbl1)) -->1 2 3
print(table.unpack({"Mon","Tue","3rd","4th"},2,3))  --> Tue 3rd
--5.2 Variadic Functions
--lua里用...表示可变参数，可以直接用...来传递
--5.2中新增了一个table.pack函数,可以把{...}重新打包,并且加入一个n来表示参数的个数,因为如果可变参数有洞的话不好知道参数个数
function removeNils(...)
	local args = table.pack(...)
	for i=1, args.n do
		print(args[i])
	end
end
removeNils(1,nil,3,2)

--Exercise5.1
function concatenateStrings(...)
	local str=""
	for k,v in pairs{...} do
		if v ~= nil then
			str = str..v
		end
	end
	return str
end
print(concatenateStrings("a","b","cedf","last"))

--Exercise5.2
local array={1,2,3,4,5}
function printArray1(arr)
	print(table.unpack(arr))
end
function printArray2(arr)
	for k,v in ipairs(arr) do
		io.write(v.." ")
	end
	io.write("\n")
end
printArray1(array)
printArray2(array)

--Exercise5.3
function removeFirst(...)
	local t = table.pack(...)
	return table.unpack(t,2,n)	
end
print(removeFirst(1,2,3,4,5))
