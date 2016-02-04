# JAVA7
[Java 7 的7个新特性]("http://www.cnblogs.com/loveis/articles/2013311.html")

	1.对集合类的语言支持；

	2.自动资源管理；

	3.改进的通用实例创建类型推断；

	4.数字字面量下划线支持；

	5.switch中使用string；

	6.二进制字面量；

	7.简化可变参数方法调用。


[JAVA 7新特性——在单个catch代码块中捕获多个异常，以及用升级版的类型检查重新抛出异常]("http://www.importnew.com/7015.html")

	在Java 7中，我们可以用一个catch块捕获所有这些异常：
	catch(IOException | SQLException | Exception ex){
     logger.error(ex);
     throw new MyException(ex.getMessage());
	}
	
	如果用一个catch块处理多个异常，可以用管道符（|）将它们分开，在这种情况下异常参数变量（ex）是定义为final的，所以不能被修改。这一特性将生成更少的字节码并减少代码冗余。

	另一个升级是编译器对重新抛出异常（rethrown exceptions）的处理。这一特性允许在一个方法声明的throws从句中指定更多特定的异常类型。