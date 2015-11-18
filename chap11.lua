--11.4 Queues and Double Queues
List = {}
function List.new()
	return {first = 0, last = -1}
end

function List.pushfirst(list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end
function List.pushlast(list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end
function List.popfirst(list)
	local first = list.first
	if first > list.last then
		error("list is empty")
	end
	local value = list[first]
	list[first] = nil
	list.first = first + 1
	return value
end
function List.poplast(list)
	local last = list.last
	if list.first > last then
		error("list is empty")
	end
	local value = list[last]
	list[last] = nil
	list.last = last - 1
	return value
end

list = List.new()
List.pushlast(list,2)
List.pushfirst(list,1)
print(List.popfirst(list))
print(List.poplast(list))

--11.6 String Buffers
--table.concat 返回给定列表中所有string的concatenation
--[[
local t={}
for line in io.lines() do
	t[#t+1] = line .. "\n"
end
local s=table.concat(t)
--]]
--table.concat第二个参数可以指定一个连接符
--上例中的第5行可以改为t[#t+1] = line
--第7行改为s = table.concat(t, "\n") .. "\n"
