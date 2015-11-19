--我们只能为tables或者userdata设置metatables
--13.1 Arithmetic Metamethods
--可以为metatable定义的算数方法包括：
--__add(+),__sub(-),__mul(*),__div(/),__unm(负),__mod(%),__pow(^)
--还有__concat，连接操作使用

--13.2 Relational Metamethods
--可以定义的metamethods包括:
--__eq(==), __lt(<), __le(<=),其他的以另外的方式计算
--如果两个比较的值类型不同，则==操作符始终返回false,甚至不会调用metatable中的__eq方法.

--13.3 Library-Defined Metamethods
--如果设置了一个metatable中的__metatable字段，那么getmetatable会返回其值，而setmetatable会抛出一个error，这样可以保护metatable
local set_mt={}
set_mt.__metatable="not your business"
Set = {}
function Set.new(l)
	local t={}
	setmetatable(t, set_mt)
	for _,v in ipairs(l) do
		t[v] = true
	end
	return t
end
s1 = Set.new{}
print(getmetatable(s1)) -->not your business
--setmetatable(s1,{}) -->error:cannot change a protected metatable

--13.4 Table-Access Metamethods
--当访问一个表中不存在的index时，如果没有__index的metamethod,返回nil；否则metamethod负责提供结果
local prototype = {x=0,y=0,width=100}
local mt={}
function new(o)
	setmetatable(o, mt)
	return o
end

mt.__index = function (_,key)
	return prototype[key]
end
w=new{x=10}
print(w.y..","..w.width) -->0,100
--__index除了可以是一个metamethod之外也可以是一张表：
--mt.__index = prototype和前面的function实现了一样的功能
--如果不想使用这一套访问index的机制，lua提供了rawget(tbl,idx)函数来访问原生的index
--__newindex和__index是差不多的,__index用来控制访问,__newindex用来控制表的更新,与rawget对应的是rawset(tbl,key,value)

--Exercise 13.1
function set_mt.__sub(a,b)
	local ret=Set.new{}
	for v in pairs(a) do
		if not b[v] then
			ret[v] = true
		end
	end
	return ret
end
function set_mt.__tostring(a)
	local s = "{"
	local sep = ""
	for v in pairs(a) do
		s = s..sep..v
		sep=","
	end
	return s.. "}"
end
local seta = Set.new{1,2,3,4,5}
local setb = Set.new{2,4,6}
print(seta-setb) -->{1,3,5}

--Exercise 13.2
function set_mt.__len(a)
	local count = 0
	for v in pairs(a) do
		count = count + 1
	end
	return count
end
local setc = Set.new{1,3,4,5,"dw","faq"}
print(#setc) -->6

--Exercise 13.3
local index={}
local proxy_mt = {
	__index = function (t,k)
		print("*access to elemnt "..tostring(k))
		return t[index][k]
	end,
	__newindex = function(t,k,v)
		print("*update of element "..tostring(k)..
		" to "..tostring(v))
		t[index][k] = v
	end,
	__pairs = function (t)
		return function(t,k)
			return next(t[index],k)
		end,t
	end,
	__ipairs = function(t)
		return function(t,i)
			i = i + 1
			local v = t[i]
			if not v then
				return
			end
			return i,v
		end, t[index], 0
	end
}
function track(t)
	local proxy={}
	proxy[index] = t
	setmetatable(proxy,proxy_mt)
	return proxy
end

local proxy1=track{3,5,8,10,a="b"}
print(proxy1[2])
proxy1[1]=101
for k,v in pairs(proxy1) do
	print(k..":"..v)
end
print("-----")
for k,v in ipairs(proxy1) do
	print(k..":"..v)
end
print("-----")

--Exercise 13.4
local readonly_mt = {}
readonly_mt.__index = function(t,k)
	return t.values[k]
end
readonly_mt.__newindex = function(t,k,v)
	error("this is a read-only table!")
end
function readOnly(t)
	local proxy = {values=t}
	setmetatable(proxy, readonly_mt)
	return proxy
end
local ro = readOnly{"first","second","third"}
print(ro[1],ro[3]) -->first	third
--ro[2]="2nd" -->error:this is a read-only table!
local ro2 = readOnly{1,2,3,5,7,11,13}
print(ro2[5], ro2[6]) -->7 11
--ro2[5]=111 -->error:this is a read-only table!
