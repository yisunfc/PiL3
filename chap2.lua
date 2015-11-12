--Lua中有8种:nil, boolean, number, string, userdata, function, thread, and table
--变量没有预定义的类型，任何变量可以持有任何类型的值。
--type函数给出任意给出值的类型:
print(type("hello")) 	-->string
print(type(10.4*3))		-->number
print(type(print))		-->function
print(type(type))		-->function
print(type(true))		-->boolean
print(type(nil))		-->nil
print(type(type(X)))	-->string
--2.2 Booleans
--在lua中只有nil和false会在条件语句中返回false，其它(包括0和空字符串)都会返回true。
--2.3 Numbers
--可以在lua里这样表示数字：
--4.57e-3 0.3e12 5E+20
--0xff(255) 0x1A3(419) 0x0.2(0.125)
--2.4 Strings
--lua的字符串中可以包含'\0'
--可以在字符串之前使用#来获取字符串长度
local str = "hello"
print(#str) -->5
print(#"good\0bye") -->8
--长字符串的一种表示方法：以[[开始，]]结束
page = [[
<html>
<head>
  <title>An HTML Page</title>
</head>
</html>
]]
print(page)
--lua5.2中加入了特殊字符\z:它会跳过后面所有的字符直到下一个非空字符
data = "abc\z
		  123"
print(data) -->abc123
--任何数字和字符串的运算都会尝试将字符串转化为数字:
print("10"+1) -->11
--如果在期待字符串的地方发现数字,lua也会把数字转化为字符串
print(10 .. 20) -->1020 note:数字前后有空格,否则第一个.会被认为是小数点
--以上两种转化并不是好主意,应该使用tonumber和tostring这两个函数
--2.5 Tables
--表是匿名的,我们只能保存它的引用
--对于一个table a, a.x和a["x"]是等价的,a[x]则是以变量x为key的对应value
local var="xxx"
local tt={}
tt[var]=123
print("-------------")
print(tt[var] ..","..tt["xxx"]) -->123,123
var=nil
print(tt[var]) -->nil 因为tt里实际保存键值对是"xxx"->123
print(tt["xxx"]) -->123
print("-------------")

--Exercise 2.4
local str24 = [=[
<![CDATA[
  Hello world
]]>
	   ]=]
local str242 = "<![CDATA[\n Hello world\n]]>"
print(str24)
print(str242)
