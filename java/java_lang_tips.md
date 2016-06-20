### JAVA Lang Tips

[System.getProperty获得系统属性](http://blog.csdn.net/peterxiaoq/article/details/18733373)]
	
	java.vendor Java 运行时环境供应商 
	java.vendor.url Java 供应商的 URL 
	java.home Java 安装目录 
	java.vm.specification.version Java 虚拟机规范版本 
	java.vm.specification.vendor Java 虚拟机规范供应商 
	java.vm.specification.name Java 虚拟机规范名称 
	java.vm.version Java 虚拟机实现版本 
	java.vm.vendor Java 虚拟机实现供应商 
	java.vm.name Java 虚拟机实现名称 
	java.specification.version Java 运行时环境规范版本 
	java.specification.vendor Java 运行时环境规范供应商 
	java.specification.name Java 运行时环境规范名称 
	java.class.version Java 类格式版本号 
	java.class.path Java 类路径 
	java.library.path 加载库时搜索的路径列表 
	java.io.tmpdir 默认的临时文件路径 
	java.compiler 要使用的 JIT 编译器的名称 
	java.ext.dirs 一个或多个扩展目录的路径 
	os.name 操作系统的名称 
	os.arch 操作系统的架构 
	os.version 操作系统的版本 
	file.separator 文件分隔符（在 UNIX 系统中是“/”） 
	path.separator 路径分隔符（在 UNIX 系统中是“:”） 
	line.separator 行分隔符（在 UNIX 系统中是“/n”） 
	user.name 用户的账户名称 
	user.home 用户的主目录 
	user.dir 用户的当前工作目录 

[JAR 文件揭密]("http://www.ibm.com/developerworks/cn/java/j-jar/")

	用一个单独的文件创建一个 JAR 文件	jar cf jar-file input-file...
	用一个目录创建一个 JAR 文件	jar cf jar-file dir-name
	创建一个未压缩的 JAR 文件	jar cf0 jar-file dir-name
	更新一个 JAR 文件	jar uf jar-file input-file...
	查看一个 JAR 文件的内容	jar tf jar-file
	提取一个 JAR 文件的内容	jar xf jar-file
	从一个 JAR 文件中提取特定的文件	jar xf jar-file archived-file...
	运行一个打包为可执行 JAR 文件的应用程序	java -jar app.jar

[@SuppressWarnings注解]("http://blog.sina.com.cn/s/blog_ad8b5870010166vt.html")

	@SuppressWarnings(“”)
	@SuppressWarnings({})
	@SuppressWarnings(value={})

	@SuppressWarnings("unchecked") 告诉编译器忽略 unchecked 警告信息，如使用List，ArrayList等未进行参数化产生的警告信息。
	@SuppressWarnings("serial") 如果编译器出现这样的警告信息：The serializable class WmailCalendar does not declare a static final serialVersionUID field of type long
       使用这个注释将警告信息去掉。
	@SuppressWarnings("deprecation") 如果使用了使用@Deprecated注释的方法，编译器将出现警告信息。
       使用这个注释将警告信息去掉。
	@SuppressWarnings("unchecked", "deprecation") 告诉编译器同时忽略unchecked和deprecation的警告信息。
	@SuppressWarnings(value={"unchecked", "deprecation"}) 等同于@SuppressWarnings("unchecked", "deprecation")


[java中byte数组与int类型的转换（两种方式）]("http://blog.csdn.net/reamerit/article/details/4291913")