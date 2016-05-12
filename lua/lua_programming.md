# lua programming

Lua 是大小写敏感的. 注释:单行注释:-- 多行注释:--[[ --]]

Lua 是动态类型语言,变量不要类型定义。Lua 中有 8 个基本类型分别为:nil、boolean、 number、string、userdata、function、thread 和 table。	函数 type 可以测试给定变量或者值 的类型。
	
	print(type("Hello world"))	--> string	print(type(10.4*3))			--> number	print(type(print))			--> function	print(type(type))			--> function	print(type(true))			--> boolean	print(type(nil))			--> nil	print(type(type(X)))		--> string
	
	
使用[[...]]表示字符串。这种形式的字符串可以包含多行也,可以嵌套且不会 解释转义序列,如果第一个字符是换行符会被自动忽略掉。这种形式的字符串用来包含 一段代码是非常方便的。
	page = [[	<HTML>	<HEAD>	<TITLE>An HTML Page</TITLE>	</HEAD>	<BODY>	Lua	[[a text between double brackets]]	</BODY>	</HTML>	]]	io.write(page)	
	
Lua 会自动在 string 和 numbers 之间自动进行类型转换,当一个字符串使 用算术操作符时,string 就会被转成数字。
	print("10" + 1)			--> 11	
	print("hello" + 1)		-- ERROR (cannot convert "hello")
	..在 Lua 中是字符串连接符,当在一个数字后面写..时,必须加上空格以防止被解释错。如果操作数为数字,Lua 将数字转成字符串
	print(10 .. 20)      --> 1020
	
关系运算符
	< > <= >= == ~=
	逻辑运算符，逻辑运算符认为 false 和 nil 是假(false),其他为真,0 也是 true	
	and or not
and 和 or 的运算结果不是 true 和 false,而是和它的两个操作数相关。
	 a and b -- 如果 a 为 false,则返回 a,否则返回 	b
	 a or b -- 如果a为true,则返回a,否则返回b	例如
	print(4 and 5) --> 5	print(nil and 13) --> nil	print(false and 13) --> false	print(4 or 5)	--> 4	print(false or 5) --> 5

	如果 x 为 false 或者 nil 则给 x 赋初始值 v 	x = x or v构造器是创建和初始化表的表达式。表是 Lua 特有的功能强大的东西。最简单的构造函数是{},用来创建一个空表。可以直接初始化数组:	Lua将"Sunday"初始化days[1](第一个元素索引为1),用"Monday"初始化days[2]... print(days[4]) --> Wednesday 构造函数可以使用任何表达式初始化:	如果想初始化一个表作为 record 使用可以这样:	a = {x=0, y=0} <--> a = {}; a.x=0; a.y=0	 days = {"Sunday", "Monday", "Tuesday", "Wednesday",              "Thursday", "Friday", "Saturday"Lua 可以对多个变量同时赋值,变量列表和值列表的各个元素用逗号分开,赋值语 句右边的值会依次赋给左边的变量。	 a, b = 10, 2*x <--> a=10; b=2*x多值赋值经常用来交换变量,或将函数调用返回给变量: 
	a, b = f()	f()返回两个值,第一个赋给 a,第二个赋给 b。
	
当变量个数和值的个数不一致时,Lua 会一直以变量个数为基础采取以下策略:例如:      
      a = "hello" .. "world"t.n = t.n + 1             x, y = y, x -- swap 'x' for 'y' a[i], a[j] = a[j], a[i] -- swap 'a[i]' for 'a[i]'       
       a. 变量个数 > 值的个数 按变量个数补足 nil 
       b. 变量个数 < 值的个数 多余的值会被忽略
       
### 局部变量
使用 local 创建一个局部变量,与全局变量不同,局部变量只在被声明的那个代码块 内有效。代码块:指一个控制结构内,一个函数体,或者一个 chunk(变量被声明的那 个文件或者文本串)。       
### break 和 return 语句Lua 语法要求 break 和 return 只能出现在 block 的结尾一句(也就是说:作为 chunk 的最后一句,或者在 end 之前,或者 else 前,或者 until 前)
有时候为了调试或者其他目的需要在 block 的中间使用 return 或者 break,可以显式 的使用 do..end 来实现
### 函数
调用函数的时候,如果参数列表为空,必须使用()表明是函数调用。
上述规则有一个例外,当函数只有一个参数并且这个参数是字符串或者表构造的时 候,()可有可无
### 多返回值
Lua 函数可以返回多个结果值,比如 string.find,其返回匹配串“开始和结束的下标”(如果不存在匹配串返回 nil)。
Lua 函数中,在 return 后列出要返回的值得列表即可返回多值
### 命名参数
Lua 的函数参数是和位置相关的,调用时实参会按顺序依次传给形参。有时候用名 字指定参数是很有用的,比如 rename 函数用来给一个文件重命名,有时候我们我们记不 清命名前后两个参数的顺序了:
	rename{old="temp.lua", new="temp1.lua"}
	
	
