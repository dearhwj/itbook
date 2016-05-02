# cscope  Tips

[cscope中这样生成cscope.files](http://blog.csdn.net/david_xtd/article/details/7737653)
		
	find `pwd` -name "*.[ch]" -o -name "*.cpp" > cscope.files  
	cscope -bR -i cscope.files	
	上述命令中使用`pwd`取得绝对路径名，以防止使用cscope时出现找不到文件的情况；
	
[cscope的用法](http://blog.chinaunix.net/uid-21843387-id-105975.html)
		
	find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
	cscope -bkq -i cscope.files
	ctags -R
	
	cscope.out, cscope.in.out, cscope.po.out。
	其中cscope.out是基本的符号索引，后两个文件是使用"-q"选项生成的，可以加快cscope的索引速度。
	这个脚本，首先使用find命令，查找当前目录及子目录中所有后缀名为".h", ".c"和".c"的文件，并把查找结果重定向到文件cscope.files中。然后cscope根据cscope.files中的所有文件，生成符号索引文件。最后一条命令使用ctags命令，生成一个tags文件，在vim中执行":help tags"命令查询它的用法。它可以和cscope一起使用。上面所用到的命令参数，含义如下：
	-R: 在生成索引文件时，搜索子目录树中的代码
	-b: 只生成索引文件，不进入cscope的界面
	-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
	-k: 在生成索引文件时，不搜索/usr/include目录
	-i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用“-”，表示由标准输入获得文件列表。
	-I dir: 在-I选项指出的目录中查找头文件
	-u: 扫描所有文件，重新生成交叉索引文件
	-C: 在搜索时忽略大小写
	-P path: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用它了。


[CSCOPE使用中问题小解](http://tonybai.com/2009/02/23/solve-some-problems-when-using-cscope/)

	让cscope.out内的符号以绝对路径的形式存储，这样无论在何处进入VIM，都能跳转到相应的符号定义的文件中；
	其实解决上述两个问题的方法有多种，这里只是先说说我的一种方法，估摸着还不是最优的。在cscope官方有篇文章“Using Cscope on large projects”，里面关于cscope.out生成的方法可以解决第二个问题，即使用cscope.files来生成cscope.out。cscope.files中的内容很简单，就是文件列表，将你要进行扫描的所有文件的路径cscope.files中，然后执行cscope -bqk即可得到cscope.out。
	
	
[how can I display all function name from cscope database?](http://stackoverflow.com/questions/23766566/how-can-i-display-all-function-name-from-cscope-database)

	cscope -R -L -2 ".*" | awk -F ' ' '{print $2 "#" $1}' | sort | uniq
	
		