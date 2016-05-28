# Lua Tips
[Lua 5.1 参考手册](http://old.sebug.net/paper/books/lua/lua_manual.html)


[Lua中的loadfile、dofile、require详解](http://www.jb51.net/article/55125.htm)


	1.loadfile——只编译，不运行

	2. dofile就是会执行代码的家伙了
	
	3. equire和dofile有点像，不过又很不一样，require在第一次加载文件的时候，会执行里面的代码。但是，第二次之后，再次加载文件，则不会重复执行了。换句话说，它会保存已经加载过的文件，不会重复加载。