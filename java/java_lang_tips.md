### JAVA Lang Tips

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