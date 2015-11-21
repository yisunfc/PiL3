--lua通过:给调用的函数增加一个self参数(类似于C++中的this指针),来实现面向对象的用法。这只是一个语法上的syntax facility

--Exercise 16.1
Stack = {tp = 0}
--push, pop, top, isempty
function Stack:push(v)
	self.tp = self.tp + 1
	self[self.tp] = v
end
function Stack:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
function Stack:top()
	if self.tp > 0 then
		return self[self.tp]
	else 
		return nil
	end
end
function Stack:pop()
	if self.tp > 0 then
		self[self.tp] = nil
		self.tp = self.tp - 1
	end
end
function Stack:isempty()
	return  self.tp == 0
end

local st = Stack:new()
print(st:isempty())
for i=1, 5 do
	st:push(i)
end
for i=1, 2 do
	print(st:top())
	st:pop()
end
print(st:top())
print(st:isempty())

--Exercise 16.2
print("--Exercise 16.2")
StackQueue = Stack:new{bp = 0}
function StackQueue:insertbottom(v)
	self[self.bp] = v
	self.bp = self.bp - 1
end
function StackQueue:isempty()
	return self.bp == self.tp
end
function StackQueue:print()
	for i=self.bp+1, self.tp, 1 do
		io.write(self[i].." ")
	end
	io.write("\n")
end
sq = StackQueue:new()
print(sq:isempty())
for i=1,12 do 
	sq:push(i)
end
for i=1, 4 do
	sq:insertbottom(i)
end
sq:print()
