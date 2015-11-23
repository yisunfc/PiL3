function printx(v)
	print(string.format("0x%X", v))
end
print(bit32.band(1,1))
print(bit32.bor(1,0x2))
print(bit32.bxor(0,0))
print(bit32.bnot(1))

--可以用bit32.bor(num)来求得其整数
print(bit32.bor(4.32))
print(bit32.bor(math.pi))

--除了arithmetic shift之外，其他的shift都是以0填充空位，ar shift已signal bit(its last bit)填充
print(bit32.rshift(1,-5)) -->32
print(bit32.lshift(1,5)) -->should equal to the above result 

--bit32.extract(x,f,w)从x中返回从f开始的w个位,如果w为空默认是1位
printx(bit32.extract(0xABCDEF98,16,16))
printx(bit32.extract(0x12345678,8,12))
--bit32.replace是替换x中的bits

--Exercise 19.1
--if a number is power of 2, it should contain only one 1 bit in all its bits.
function isPowerOfTwo(num)
	num = bit32.bor(num)
	local b = 0
	while num > 0 do
		if bit32.band(num, 1) == 1 then
			if b == 1 then
				return false
			else
				b = 1
			end
		end
		num = bit32.rshift(num, 1)
	end
	return b == 1
end
print(isPowerOfTwo(1))
print(isPowerOfTwo(2))
print(isPowerOfTwo(3))
print(isPowerOfTwo(4))
print(isPowerOfTwo(math.pi))
print(isPowerOfTwo(10231231.212312))

--Exercise 19.3
--note: should start comparing from the top bit
function isPalindrome(num)
	num = bit32.bor(num)
	local top = 31
	while top >= 0 and bit32.extract(num, top) ~= 1 do
		top = top - 1
	end
	local mid = math.floor(top/2)
	for i = 0, mid do
		if bit32.extract(num, i) ~= bit32.extract(num, top-i) then
			return false
		end
	end
	return true
end
print(isPalindrome(9))
print(isPalindrome(27))
print(isPalindrome(41))
print(isPalindrome(100))
