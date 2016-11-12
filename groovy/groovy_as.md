# Groovy中使用as

### 定义导入别名
只要在import一个类或方法的时候使用as操作符，就可以对其进行重命名

	import java.lang.Math as M  // 定义类的别名  
	assert M.log10(100) == 2  
  
	import static M.log10 as log    // 定义方法的别名  
	assert log(1000) == 3  


## 类型转换
语法为“变量 as 类型”，在执行这个操作时
1. 将调用左操作数的类的asType方法：
2. 也可以使用as操作符把一个map转换成一个bean：
3. 把一个list用as操作符转换成其他类型时，将使用该类型的合适的构造函数
4. 可以把一个闭包转换成interface，如果该interface中有多个方法，则这些方法都会调用该闭包
5. 以把一个闭包的map转换成interface	