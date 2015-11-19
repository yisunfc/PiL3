--4.1 Assignment
--可以使用赋值符号来交换两个变量
x=10;y=1
x,y=y,x
print(x..","..y) -->1,10
--赋值时，如果左边的变量数量多于右边的值个数，则多出来的变量被赋予nil
--如果右边的值数量多于左边的值个数，则多出来的变量被丢弃
--4.3 Control Structures
--repeat-until语句在until条件为true时停止
--4.4 break,return and goto
--如果想要在function中提前使用return结束,可以用do return end的方法
function earlyExit()
	local a=0
	for i=1,100 do
		do return 0 end --without do ... end there will be a error
		a = a+i
	end
	return a
end
print(earlyExit())	-->0
--::continue::这样的写法定义了一个goto所使用的名为continue的label
