--20.1 Insert and Remove
--table.insert(tbl,pos,o) 在tbl表中的pos位置上插入o
--table.insert(tbl,o) 在tbl表中最后插入o
--table.remove移除并返回一个对象，如果不指定位置移除最后一个

--20.2 Sort
lines = {
	luaH_set = 10,
	luaH_get = 24,
	luaH_present = 48,
}
a = {}
--note:we only need the key,so it is "for n",
--if we need the value also, it should be "for n,v"
for n in pairs(lines) do
	a[#a+1] = n 
end
table.sort(a)
for _,n in ipairs(a) do
	print(n)
end

--Exercise 20.1
function rconcat(list, sep)
	if type(list) ~= "table" then
		return list
	end
	local tbl = {}
	for i = 1, #list do
		if type(list[i]) ~= "table" or #list[i] > 0 then
			tbl[#tbl+1] = rconcat(list[i], sep)
		end
	end
	return table.concat(tbl, sep)
end
print(rconcat({{{"a","b"},{"c"}},"d",{},{"e"}},";"))
