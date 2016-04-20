# Scala之Hello World
[Scala环境安装设置](http://www.yiibai.com/scala/scala_environment_setup.html)


[Scala从零开始：使用Intellij IDEA写hello world](http://www.tuicool.com/articles/BzI3UfZ)

	package com.doggie  
  
		object HelloWorld {  
		  def main(args: Array[String]): Unit = {  
      println("hello world")  
	  }  
  
	}
	
	我们注意到main方法并没有使用static修饰，而Scala中已经摒弃了static作为方法的关键字。mian方法的入参是一个Array[String]，即为一个String数组，这与Java中一致。但是Scala中使用方括号而不是尖括号来指定泛型的类型。这有效避免了与尖括号作为方法名称（以后的文章中会涉及）的混淆。

	而Scala类中方法的定义形式如下：def 方法名(参数): 返回值类型 = {方法体}

	其中参数和返回值的模式为：val: type，这种变量名在前、变量类型在后、相互之间使用冒号隔开的方式将贯穿在Scala的代码中。另外方法和方法体之间使用等号隔开。

	返回值的类型为Unit，相当于java中的void。

	java中使用print和println方法向控制台输出，地位相当于java中的System.out.print以及System.out.println，实际上通过查阅代码，print和println确实是对System.out中相应方法的调用：  