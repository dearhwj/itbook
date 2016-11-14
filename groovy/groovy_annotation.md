# Groovy注解

### @ToString

	@groovy.transform.ToString

	@ToString AST 转换能够生成人类可读的类的 toString 形式


### @groovy.transform.EqualsAndHashCode
	
	@EqualsAndHashCode AST 转换主要目的是为了生成 equals 和 hashCode 方法。生成的散列码遵循 Josh Bloch 所著的 Effective Java 中所介绍的最佳实践
	
	
### @groovy.transform.TupleConstructor

	@TupleConstructor 标注主要用处在于，通过生成构造函数消除样板文件代码。为每个属性创建一个元组构造函数，并配置默认值（使用的是 Java 默认值）	

### @groovy.transform.Canonical


	@Canonical AST 转换结合了 @ToString、@EqualsAndHashCode 和 @TupleConstructor 这三个标记的效果。
	
### @groovy.lang.Category

@Category AST 转换简化了 Groovy 类别的创建工作。	
###  @groovy.lang.Delegate
@Delegate 是一个编译时注释，指导编译器将所有 delegate 的方法和接口推到外部类中。


### @Immutable

不变对象意指创建后无法改变的对象。人们经常需要这类对象，因为他们够简单并且可以在多线程环境下安全的共享.Groovy可以按照下面的方式来定义一个不变的类：

	@Immutable final class Coordinates {
   	 	Double latitude, longitude
	}

### @Lazy
有时你想延迟加载某些属性，即只在第一次使用时才会进行处理，这通常发生在处理时间长、内存消耗大的情况下.

	class Person {
   	 	@Lazy List pets = { /* complex computation here */ }()
	}	


### @Newify
@Newify提出了实例化类的两种新方式。

### @Singleton
不管singleton是模式还是反模式，在某些情况下我们还是会使用到它的。过去我们需要创建一个私有的构造方法，然后为static属性或是初始化过的public static final属性创建一个getInstance()方法


	@Singleton class T {}
	接下来只需使用T.instance就可以访问该单例了（直接的public字段访问）。

	你还可以通过额外的注解参数实现延迟加载：

	@Singleton(lazy = true) class T {}