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