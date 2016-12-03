# Groovy Closure

http://attis-wong-163-com.iteye.com/blog/1239819

http://blog.csdn.net/hello__zero/article/details/51424173


### 闭包参数

* Closure.maximumNumberOfParameters 表示参数个数
* Closure.parameterTypes 表示闭包参数类型


### 闭包参数
* owner：代表闭包的外层包如果没有,就是闭包本身
* this:永远指向闭包最外层的类
* delegate:闭包委托类


### 闭包作为返回值

	def multiply(x) {
		return {y->return x*y}
	}
	
	
### 闭包和 ExpandoMetaClass

```
String.metaClass.shout = {->
  return delegate.toUpperCase()
}

println "Hello MetaProgramming".shout()

```


未包含任何参数的 shout() 闭包被添加到 String 的 ExpandoMetaClass (EMC) 中。每个类 — 包括 Java 和 Groovy — 都包含在一个 EMC 中，EMC 将拦截对它的方法调用。这意味着即使 String 为 final，仍然可以将方法添加到其 EMC 中。因此，现在看上去仿佛 String 有一个 shout() 方法。



### 参考资料
[实战 Groovy: 使用闭包、ExpandoMetaClass 和类别进行元编程](http://www.ibm.com/developerworks/cn/java/j-pg06239.html)
	