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


	
