# linux tr命令详解
原文地址:[ http://blog.csdn.net/jeffreyst_zb/article/details/8047065]( http://blog.csdn.net/jeffreyst_zb/article/details/8047065)

### 用途

通过使用tr，您可以非常容易地实现 sed 的许多最基本功能。您可以将 tr 看作为 sed的（极其）简化的变体：它可以用一个字符来替换另一个字符，或者可以完全除去一些字符。您也可以用它来除去重复字符。这就是所有 tr所能够做的。tr用来从标准输入中通过替换或删除操作进行字符转换。tr主要用于删除文件中控制字符或进行字符转换。使用tr时要转换两个字符串：字符串1用于查询，字符串2用于处理各种转换。tr刚执行时，字符串1中的字符被映射到字符串2中的字符，然后转换操作开始。

命令用法

	tr -c -d -s [“string1_to_translate_from”][“string2_to_translate_to”] < input-file

这里：

-c 用字符串1中字符集的补集替换此字符集，要求字符集为ASCII。

-d 删除字符串1中所有输入字符。

-s 删除所有重复出现字符序列，只保留第一个；即将重复出现字符串压缩为一个字符串。

input-file是转换文件名。虽然可以使用其他格式输入，但这种格式最常用。

2、字符范围
指定字符串1或字符串2的内容时，只能使用单字符或字符串范围或列表。

[a-z] a-z内的字符组成的字符串。

[A-Z] A-Z内的字符组成的字符串。

[0-9] 数字串。

\octal 一个三位的八进制数，对应有效的ASCII字符。

[O*n] 表示字符O重复出现指定次数n。因此[O*2]匹配OO的字符串。

tr中特定控制字符的不同表达方式
速记符含义八进制方式


\a Ctrl-G 铃声\007

\b Ctrl-H 退格符\010

\f Ctrl-L 走行换页\014

\n Ctrl-J 新行\012

\r Ctrl-M 回车\015

\t Ctrl-I tab键\011

\v Ctrl-X \030

实例：将文件file中出现的”abc”替换为”xyz”

	 cat file | tr “abc” “xyz” > new_file

	【注意】这里，凡是在file中出现的”a”字母，都替换成”x”字母，”b”字母替换为”y”字母，”c”字母替换为”z”字母。而不是将字符串”abc”替换为字符串”xyz”。
 

### 范例

1.使用tr命令“统一”字母大小写  

	（小写 –> 大写）
	 cat file | tr [a-z] [A-Z] > new_file
	（大写 –> 小写）
	 cat file | tr [A-Z] [a-z] > new_file
 

2.把文件中的数字0-9替换为a-j

	cat file | tr [0-9] [a-j] > new_file
	
4.删除文件file中出现的”Snail”字符

	cat file | tr -d “Snail” > new_file

	【注意】这里，凡是在file文件中出现的’S’,’n’,’a’,’i’,’l’字符都会被删除！而不是紧紧删除出现的”Snail”字符串。
	
5.删除文件file中出现的换行’\n’、制表’\t’字符

	cat file | tr -d “\n\t” > new_file

	不可见字符都得用转义字符来表示的，这个都是统一的。

6.删除“连续着的”重复字母，只保留第一个

	cat file | tr -s [a-zA-Z] > new_file

7.删除空行

	cat file | tr -s “\n” > new_file
	
8.删除Windows文件“造成”的’^M’字符

	cat file | tr -d “\r” > new_file
	或者
	cat file | tr -s “\r” “\n” > new_file

	【注意】这里-s后面是两个参数”\r”和”\n”，用后者替换前者

9.用空格符\040替换制表符\011

	cat file | tr -s “\011” “\040” >new_file
	
10.把路径变量中的冒号”:”，替换成换行符”\n”

	echo $PATH | tr -s “:” “\n”
	
11.可以在vi内使用所有这些命令！只要记住：在tr命令前要加上您希望处理的行范围和感叹号 （！），

	如 1,$!tr -d ‘\t’（美元符号表示最后一行）
	
12.另外，当有人给您发送了一个在 Mac OS 或 DOS/Windows 机器上创建的文本文件时，您会发现tr非常有用

	如果没有将文件保存为使用 UNIX 换行符来表示行结束这种格式，则需要将这样的文件转换成本机 UNIX 格式，否则一些命令实用程序不会正确地处理这些文件Mac OS 的行尾以回车字符(\r)结束，许多文本处理工具将这样的文件作为一行来处理为了纠正这个问题，可以用下列技巧： 
	Mac -> UNIX：tr “\r” “\n”<macfile > unixfile 
	UNIX -> Mac：tr “\n” “\r”<unixfile > macfile 
	Microsoft DOS/Windows 约定，文本的每行以回车字符(\r)并后跟换行符(\n)结束为了纠正这个问题，可以使用下列命令： 
	DOS -> UNIX：tr -d “\r”<dosfile > unixfile 
	UNIX -> DOS：在这种情况下，需要用awk，因为tr不能插入两个字符来替换一个字符要使用的 awk 命令为 awk ‘{ print $0″\r” }'<unixfile > dosfile 
	注：都可以用sed 来完成
	
13.若要将大括号转换为小括号

	tr ‘{}’ ‘()’ < textfile > newfile
	这便将每个 {（左大括号）转换成 (（左小括号），并将每个 }（右大括号）转换成 )（右小括号）。所有其他的字符都保持不变。

14.若要将大括号转换成方括号

	tr ‘{}’ ‘\[]’ < textfile > newfile
	这便将每个 {（左大括号）转换成 [（左方括号），并将每个 }（右大括号）转换成 ]（右方括号）。左方括号必须与一个 “\”（反斜扛）转义字符一起输入。

15.若要创建一个文件中的单词列表

	tr -cs ‘[:lower:][:upper:]’ ‘[\n*]’ < textfile > newfile
	这便将每一序列的字符（小、大写字母除外）都转换成单个换行符。*（星号）可以使 tr 命令重复换行符足够多次以使第二个字符串与第一个字符串一样长。

若要从某个文件中删除所有空字符

	tr -d ‘\0’ < textfile > newfile
	若要用单独的换行替换每一序列的一个或多个换行

	tr -s ‘\n’ < textfile > newfile
	或
	tr -s ‘\012’ < textfile > newfile
	若要以“？”（问号）替换每个非显示字符（有效控制字符除外）

	tr -c ‘[:print:][:cntrl:]’ ‘[?*]’ < textfile > newfile

	这便对不同语言环境中创建的文件进行扫描，以查找当前语言环境下不能显示的字符。
	要以单个“#”字符替换 <space> 字符类中的每个字符序列

	tr -s ‘[:space:]’ ‘[#*]’
