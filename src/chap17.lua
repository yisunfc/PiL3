--17.1 Weak Tables
--weak tables是一种告诉lua一个引用不需要防止被回收的机制,weak references与此类似
--table的weakness由metatable中的__mode属性给出:
--k(key),v(value),kv(key&value)
--但无论是key或者value被收回时，整个key-value对都被回收
--只有对象可以从weak table中被收回，number\bool\string都不行
local a = {}
b = {__mode = "k"}
setmetatable(a,b)
key={}
a[key]=1
key={}
a[key]=2
collectgarbage()
for k,v in pairs(a) do
	print(v)
end

--17.6 Finalizers
--Lua用__gc的metamethod来实现finalizers

o={x="hi"}
setmetatable(o, {__gc=function(o) print(o.x) end})
o=nil
print("wait")
collectgarbage() -->hi
--如果要实现析构行为，必须在设置metatable的时候，该表就拥有非空的__gc行为。如果在设置metatable后再添加__gc行为，并没有用(修改是可以的)


