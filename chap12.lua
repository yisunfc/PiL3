--12.1 Data Files
local a={}
local count = 0
function Entry(entry) 
	count = count+1
	a[#a+1] = entry[1]
end
dofile("data/data_12")
for _,v in pairs(a) do
	print(v)
end
--12.2 Serialization
--可以用string.format加%q选项来序列化字符串
a='a "problematic" \\string'
print(string.format("%q",a)) -->"a \"problematic\" \\string"

--A simple serialize function which can save numbers,strings and table without cycles.
--This function just print a object in another way, it's actually useless.
function basicSerialize(value)
	if type(value) == "number" then
		return tostring(value)
	else
		return string.format("%q",value)
	end
end
function writetab(n, begin)
	local bracket = begin and "{" or "},"
	io.write("\n")
	for i=1, n do
		io.write("    ")
	end
	io.write(bracket.."\n")
end
function serialize(name, value, n)
	n = n or 0
	for i=1, n do
		io.write("    ")
	end
	io.write(name, " = ")
	if type(value) == "number" or type(value) == "string" then
		io.write(basicSerialize(value)..",\n")
	elseif type(value) == "table" then
		writetab(n,true)
		for k,v in pairs(value) do
			local nname = string.format("[%s]", basicSerialize(k))
			serialize(nname, v, n+1)
		end
		writetab(n,false)
	else
		error("can't save type:"..type(value))
	end
end
local tbl=
{
	1,
	"abc",
	{3,4,5,bt="ooutt"},
	zs="warrior",
	["yt"]=2.1,
}
serialize("tbl", tbl)
serialize("dwadwadw","aaaa")
