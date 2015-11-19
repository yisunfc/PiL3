--9.1 Coroutine Basics
--create函数接受一个function作为参数来创建一个协程,返回一个代表新协程的thread类型的值
--status可以获取一个协程的状态
--resume开始或继续一个协程
--yield可以暂停一个协程的执行
co = coroutine.create(function() print("hi") end)
print(coroutine.status(co))
print(co)
coroutine.resume(co)
print(coroutine.status(co))
co = coroutine.create(function()
	for i=1,10 do
		print(i)
		coroutine.yield()
	end
end)
coroutine.resume(co)
--可以通过resume和yield来交换数据
co = coroutine.create(function (a,b)
	coroutine.yield(a+b, a-b)
end)
print(coroutine.resume(co, 20, 10)) -->true 30 10

--9.2 Pipes and Filters
--当一个协程调用yield时,它不会进入新的函数，而是返回到一个pending call继续执行
--调用resume不会开始新函数,而是返回到yield的地方继续执行
--下面的代码是根据本节前半段内容整理出来的
function send(x)
	coroutine.yield(x)
end
producer = coroutine.create(
	function()
		while true do
			local x = io.read()
			send(x)
		end
	end)
function receive()
	local status, value = coroutine.resume(producer)
	return value
end

function consume()
	while true do
		local x = receive()
		print(x)
	end
end
--consume()
--9.3 Coroutines as Iterators
--coroutine.wrap可以创建协程并返回一个函数，调用该函数就可以resume这个新协程
--9.4 Non-Preemptive Multithreading

local socket = require "socket"
host="dvcabin.info"
file="/index.html"
c = assert(socket.connect(host, 80))
c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")

while true do
	local s, status, partial = c:receive(2^10)
	io.write(s or partial)
	if status == "closed" then break end
end
c:close()
