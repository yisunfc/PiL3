--TODO:need recheck this chap
--Exercise 7.1
n=1;m=10
function fromto(first, last)
	function iter(last, n)
		n = n + 1
		if n <= last then
			return n
		else
			return nil
		end
	end
	return iter, last, first-1
end
function func711()
	local sum = 0
	for i=n,m do
		sum = sum + i
	end
	print(sum)
end

function func712()
	local sum = 0
	for i in fromto(n,m) do
		sum = sum + i
	end
	print(sum)
end
func711(); func712()
