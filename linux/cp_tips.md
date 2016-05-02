# cp tips
[Linux CentOS中cp复制强制覆盖拷贝的命令](http://www.lc365.net/blog/b/14164/)

	Linux下默认cp命令是有别名的(alias cp='cp -i')，无法在复制时强制覆盖，即使你用 -f 参数也无法强制覆盖文件，下面提供几个从网上找的Linux下cp命令覆盖的方法。
	1) 取消cp的alias（放心这不是永久生效）：
	#unalias cp
	#cp a /test/a

	2) 加反斜杠 \cp 执行cp命令时不走alias：
	#\cp a /test/a

	3）另外一个有意思的方法：
	#yes|cp a /test/a
