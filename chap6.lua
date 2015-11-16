--6.1 Closures
--可以这样实现一种沙盒机制,对要打开的文件做自己的权限检查
do
	local oldOpen = io.open
	local access_OK = function(filename, mode)
		--do some check
	end
	io.open = function(filename, mode)
		if access_OK(filename,mode) then
			return oldOpen(filename,mode)
		else
			return nil, "access denied"
		end
	end
end

--6.3 Proper Tail Calls
--像下面这样的无限递归调用是不会导致stack overflow的,因为lua里有tail-call elimination.
function foo(n)
	if n>0 then return foo(n-1) end
end
--只有形如return func(args)的才是tail call,其余的比如：
--return g(x)+1
--return x or g(x)
--return (g(x))
--都不是tail call

--Exercise 6.2
function newPoly(tbl)
	local t = tbl
	return function (x)
		sum = 0
		for i=1,#t do
			sum = sum + t[i]*x^(#t-i)
		end
		return sum
	end
end
f = newPoly({3,0,1})
print(f(0))	-->1
print(f(5)) -->76
print(f(10))-->301
