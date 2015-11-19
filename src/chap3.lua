--3.1 Arithmetic Operators
--%作用于实数时有妙用,也可用来标准化角度等
x=math.pi
print(x-x%1) -->3
print(x-x%0.01) -->3.14
local angle=-270
angle = angle % 360
print(angle)

--3.2 Relational Operators
--lua中比较table或userdata时,检查两个变量是否同一个对象的引用，否则即使其值完全相同,也是不等的
a = {}; a.x = 1; a.y = 0 
b = {}; b.x = 1; b.y = 0 
c=a
print(c==a) -->true
print(b==a)	-->false

--3.3 Logical Operators
--and、or操作符返回的是某个参数,并不是true或者false
print(4 and 5) --> 5
print(4 or 5) --> 4
--(a and b) or c 基本等同于C语言里的a?b:c
--x=x or v，如果x没有初值则将v赋值给x
--not 操作符返回true或者false
--3.5 The Length Operator
--#操作符只能求出顺序table的长度,也就是所谓没有洞的table.
--对于不是以数字为key的table,#求出的长度为0
local tbl1={[1]=1,[2]=3,[9]=5}
local tbl2={["a"]=1,["b"]=2,["c"]=3}
print(#tbl1) -->2
print(#tbl2) -->0
--3.7 Table Constructors
--可以在table构造时使用;来取代, 目的是区分不同类型的数据
local tbl3={x=10, y=45; "one", "two"}

--Exercise 3.3
local tbl33={1,2,3,4,5}
function polynomial(x)
	local sum = 0
	for i=1, #tbl33 do
		sum = sum + tbl33[i]*x^(i-1)
	end
	return sum
end
print(polynomial(2))

--Exercise 3.7
--t[sunday]=monday="sunday"
--t[t.sunday]=t["monday"]=t[sunday]=monday="sunday"
sunday = "monday"; monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday]) -->monday,sunday,sunday
