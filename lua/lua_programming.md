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
	
	
### table

table 是 Lua 中唯一的数据结构,其他语言所提供的数据结构,如:arrays、records、 lists、queues、sets 等,Lua 都是通过 table 来实现,并且在 lua 中 table 很好的实现了这 些数据结构。


在 lua 中通过整数下标访问 table 中元素,即是数组。并且数组大小不固定,可动态增长。通常我们初始化数组时,就间接地定义了数组的大小,例如
  		a = {} -- new array for i=1, 1000 do
		a[i] = 0		
		end
		
习惯上,Lua 的下标从 1 开始。Lua 的标准库遵循此惯例,因此你的数组下标 必须也是从 1 开始,才可以使用标准库的函数。  我们可以用构造器在创建数组的同时初始化数组:
	  squares = {1, 4, 9, 16, 25, 36, 49, 64, 81}
  		


Lua 中有两种表示矩阵的方法,一是“数组的数组”

	mt = {} -- create the matrix for i=1,N do
	for i=1,N do		mt[i] = {}    -- create a new row
		for j=1,M do			mt[i][j] = 0		end 
	end
	表示矩阵的另一方法,是将行和列组合起来。如果索引下标都是整数,通过第一个 索引乘于一个常量(列)再加上第二个索引,看下面的例子实现创建 n 行 m 列的矩阵
	mt = {} -- create the matrix for i=1,N do    for j=1,M do       mt[i*M + j] = 0	end end
		如果索引是字符串,可用一个单字符将两个字符串索引连接起来构成一个单一的索 引下标,例如一个矩阵 m,索引下标为 s 和 t,假定 s 和 t 都不包含冒号,代码为:m[s..':'..t], 如果 s 或者 t 包含冒号将导致混淆,比如("a:", "b") 和("a", ":b"),当对这种情况有疑问的 时候可以使用控制字符来连接两个索引字符串,比如'\0'。
	
### 链表

	Lua 中用 tables 很容易实现链表,每一个节点是一个 table,指针是这个表的一个域 (field),并且指向另一个节点(table)。例如,要实现一个只有两个域:值和指针的基 本链表,代码如下:	根节点:	list = nil	在链表开头插入一个值为 v 的节点: list = {next = list, value = v} 
	要遍历这个链表只需要:
	
	local l = list	while l do	   print(l.value)	l = l.next	end其他类型的链表,像双向链表和循环链表类似的也是很容易实现的。然后在 Lua 中 在很少情况下才需要这些数据结构,因为通常情况下有更简单的方式来替换链表。比如, 我们可以用一个非常大的数组来表示栈,其中一个域 n 指向栈顶。
	
	
### 集合和包	Lua 中表示这个集合有一个简单有效的方法,将所有集合中的元素作为下标存放在 一个 table 里,下面不需要查找 table,只需要测试看对于给定的元素,表的对应下标的 元素值是否为 nil。比如:
	reserved = {	   ["while"] = true,    ["end"] = true,	   ["function"] = true, ["local"] = true,	}	
	
	for w in allwords() do	   if reserved[w] then	   -- `w' is a reserved word	   ...
	   
	还可以使用辅助函数更加清晰的构造集合:	function Set (list)	   local set = {}	   for _, l in ipairs(list) do set[l] = true end	   return set	end	reserved = Set{"while", "end", "function", "local", }   
	
	
### Metatables and Metamethods
Metatables 允许我们改变 table 的行为,例如,使用 Metatables 我们可以定义 Lua 如 何计算两个 table 的相加操作 a+b。当 Lua 试图对两个表进行相加时,他会检查两个表是 否有一个表有 Metatable,并且检查 Metatable 是否有__add 域。如果找到则调用这个__add 函数(所谓的 Metamethod)去计算结果。Lua 中的每一个表都有其 Metatable。(后面我们将看到 userdata 也有 Metatable),Lua 默认创建一个不带 metatable 的新表		
对于每一个算术运算符,metatable 都有对应的域名与其对应,除了__add、__mul 外,还有__sub(减)、__div(除)、__unm(负)、__pow(幂),我们也可以定义__concat 定义 连接行为


Lua 选择 metamethod 的原则:如果第一个参数存在带有__add 域的 metatable,Lua 使用它作为 metamethod,和第二个参数无关;否则第二个参数存在带有__add 域的 metatable,Lua 使用它作为 metamethod 否则报 错。

Metatables 也允许我们使用 metamethods:__eq(等于),__lt(小于),和__le(小于 等于)给关系运算符赋予特殊的含义。对剩下的三个关系运算符没有专门的 metamethod, 因为Lua将a ~= b转换为not (a == b);a > b转换为b < a;a >= b转换为 b <= a。

如果你试图比较两个带有不同 metamethods 的 对象,Lua 也将抛出错误。
	
	
	
	
	
