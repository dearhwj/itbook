# Groovy左移位操作符<<
参考资料[http://blog.csdn.net/hivon/article/details/2341312](http://blog.csdn.net/hivon/article/details/2341312)


“<<”操作符在Java语言里被我们熟知的是位运算中的左移运算符。在Groovy语言里，它依然是左移运算符，这我们都很熟悉，在这里就不再多说。而我们要说的却是除此之外，在Groovy语言里为“<<”运算符新增的功能。

## 对List对象和Set对象的操作

	在Groovy语言里，使用“<<”运算符取代了Java语言中List类的add方法，带来了编码方面的简单和快捷。

## 对StringBuffer对象的操作
	
    而Groovy语言中，同样是使用“<<”操作符来对append方法进行简化的：
    
## 对流对象的操作

	在Java语言中，对流对象的操作通常是read和write，使用“<<”操作符代替了write方法。
 
## 其他
	除了上面的一些对“<<”操作符的常用方法，在Groovy语言中，还有一些不常用的地方也会使用到“<<”操作符

```
    class Empl {
    String name
	 staticvoid main(args) {
       Empl.metaClass.nameInUpperCase << {-> delegate.name.toUpperCase() }
       def b = new Empl(name:"Tom")
       println b.nameInUpperCase()
	 }
	}
    
```