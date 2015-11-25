--21.1 Basic String Functions
--string.rep(s,n) 返回一个重复n次s的string
print(string.rep("a",10)) -->aaaaaaaaaa
--string.sub(s,i,j) 返回s中下表为[i,j]的字符串
--下标为-1表示最后一个字符，-2表示-1前面一个字符，以此类推
print(string.sub("abcde", 2, 4))  -->bcd
print(string.sub("abcde", 1, -1)) -->abcde
--string.char和string.byte可以互相转换字符和内部数字表示
print(string.char(97)) -->a
print(string.byte("abc")) -->97
print(string.byte("abc",2)) -->98

--21.2 Pattern-Matching Functions
--string.find返回pattern的匹配，分别是开始和结束的位置
local s = "hello, world!"
i, j = s:find("hello")
print(s:sub(i,j)) -->hello
--string.find可以有第三个参数,选定find的开始位置
--string.match也查找匹配pattern,但是它直接返回匹配到的子串而不是位置
print(string.match(s, "hello")) -->hello
--string.gsub用来将string里符合pattern的子串替换为另一个
--第四个参数可以设置替换的个数
--第二个返回值显示替换的个数
print(string.gsub(s, "world", "lua")) 
--string.gmatch返回一个用来迭代指定pattern的函数
--下面这段代码将s里的所有单词存进words
local words = {}
for w in string.gmatch(s, "%a+") do
	words[#words+1] = w
end

--21.3 Patterns
--character classes:
--. 	all characters
--%a 	letters
--%c	control characters
--%d	digits
--%g	printable characters except spaces
--%l	lower-case letters
--%p	punctuation characters
--%s	space characters
--%u	upper-case letters
--%w	alphanumeric characters
--%x	hexadecimal digits

--以上这些模式的大写对应的都是不匹配该对应模式的剩余部分
print(string.gsub(s, "%a", ".")) -->....., .....!
print(string.gsub(s, "%A", ".")) -->hello..world.

--( ) . % + - * ? [ ^ $
--以上这些字符属于特殊字符,如果要匹配需要加%,比如%.匹配一个.
--lua中有4种修饰符:
--  + (1次或多次)
--  * (0次或多次) 最长匹配
--  - (0次或多次) 懒匹配(最短的)
--  ? (0次或一次)

--21.4 Captures
--string.match可以将匹配到的内容以多个结果的形式返回
pair = "name = Anna"
key,value = string.match(pair, "(%a+)%s*=%s*(%a+)")
print(key..":"..value)
