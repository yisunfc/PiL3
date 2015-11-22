--math.random函数有3种调用方式：
--无参数调用时返回[0,1)中的一个实数
--random(n)调用时返回[1,n]中的某个整数
--random(n,m)调用返回一个[n,m]中的整数
--产生随机数种子使用randomseed
math.randomseed(os.time())
print(math.random())
print(math.random(100))
print(math.random(15,19))


--Exercise 18.1
function isPowerOfTwo(num)
	while num > 1 do
		num = num / 2
	end
	if num == 1 then
		return true
	else
		return false
	end
end
print(isPowerOfTwo(100))
print(isPowerOfTwo(128))
print(isPowerOfTwo(2))
print(isPowerOfTwo(15))
print(isPowerOfTwo(11.2))

--Exercise 18.5
function randomShuffle(list)
	local size = #list
	if size <= 1 then
		return
	end
	while size > 1 do
		local index = math.random(size)
		local tmp = list[index]
		list[index] = list[size]
		list[size] = tmp
		size = size - 1
	end
end
local l={1,2,3,4,5,6,7,8,9}
randomShuffle(l)
function printList(list)
	for k,v in ipairs(list) do
		io.write(v..',')
	end
	io.write("\n")
end
printList(l)
