### Groovy Script

[groovy-脚本和类](http://www.cnblogs.com/rollenholt/archive/2013/10/02/3349051.html)
	
	相比起类来说，在groovy脚本中，变量不需要申明（def），在脚本中变量的引用将自动创建并放入Binding中。
	在groovy脚本中，为了编写一个方法，没必要像java一样必须先定义一个类，
	但是和传统的基于class的groovy而言，在类外定义函数需要使用def关键字。但是如果你需要一些比如static或者实例变量等等的东西的时候，最好写一个类。

[Groovy 脚本的多种运行方法](http://www.micmiu.com/lang/groovy/groovy-running-ways/)

	你可以用Groovy编写Unix脚本并且像Unix脚本一样直接从命令行运行它.倘若你安装的是二进制分发包并且设置好环境变量,那么下面的代码将会很好的工作。

	编写一个类似如下的脚本文件，保存为：HelloGroovy


	#!/usr/bin/env groovy
	println("this is groovy script")
	println("Hi,"+args[0]+" welcome to Groovy")
	


	然后在命令行下执行：


	$ chmod +x HelloGroovy
	$ ./HelloGroovy micmiu.com
	this is groovy script
	Hi,micmiu.com welcome to Groovy

### Grape

[Dependency management with Grape](http://docs.groovy-lang.org/latest/html/documentation/grape.html)

[《Groovy官方教程》Grape依赖管理器](http://ifeve.com/groovy-grape/)

	不是所有的依赖都在maven中心仓库里，你可以像下面这样添加新的仓库:
	@GrabResolver(name='restlet', root='http://maven.restlet.org/')
