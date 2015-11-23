--23.1 Date and Time
--os.time没有参数调用时，返回当前时间的一个数字(utc?)
--传入一个表时，返回这个表里时间对应的number
print(os.time())
print(os.time({year=1970,month=1,day=1, hour=0, min=0, sec=0}))
--os.date与time相反,"*t"参数构建一张时间表返回
local t = os.date("*t", 1448266021)
print(os.date("%Y/%m/%d %H:%M:%S", os.time()))
--os.clock()返回cpu时间


--23.2 Other System Calls
--os.exit() 终止程序执行
--os.getenv() 返回环境变量的值
print(os.getenv("HOME"))
--os.execute() 执行系统命令
os.execute("ls".." -l")
--os.setlocale(type, category)设置区域相关的内容

--Exercise 23.1
function inOneMonth()
	local t = os.date("*t", os.time())
	if t.month == 12 then
		t.year  = t.year + 1
		t.month = 1
	else
		t.month = t.month + 1
	end
	local ntime = os.time(t)
	print(os.date("%Y/%m/%d %H:%M:%S", ntime))
end
inOneMonth()
