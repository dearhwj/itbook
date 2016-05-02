# Scala Basic

[细数Scala下划线“_”的用法](http://blog.csdn.net/i6448038/article/details/50017427)
	
	var name:String=_
	这里的下划线和null的作用是一样的。
	import math._
	这里的math._就相当于Java中的math.*; 即“引用包中的所有内容”。
	
	val newArry= (1 to 10).map(_*2)
  	 println(newArry)
	这里的下划线代表了集合中的“某（this）”一个元素。这个用法很常见，在foreach等语句中也可以使用。
	
	

[类定义和构造函数](http://developer.51cto.com/art/200912/166814.htm)

	定义Scala的类比较有趣的是定义基本（primary）构造函数时在类名称后直接加上构造函数的参数表。基本构造函数参数的类型不可省略（包括模式匹配，这是对象的类型信息的基础，不能省略也是当然的）。另一方面，可以注意到类型定义中的变量定义没有指定类型，这都是靠从构造函数参数的类型推断出来的。
	由于在类中基本构造函数的参数定义前加上val或var后，对应的实例属性就会被定义，所以原来的属性定义就不需要了。
	另外，Scala中覆盖父类的方法一定要加上override修饰符。

[Scala类](http://blog.csdn.net/shijiebei2009/article/details/38666201)

	在Scala中，getter和setter分别叫做age和age_=。默认的getter和setter是由Scala自动生成，但是你也可以手动生成
	
	用@BeanProperty注解来生成JavaBeans的getXxx/setXxx方法
	
	

[Scala之主构造函数](http://blog.csdn.net/bluishglc/article/details/50899077)
	
	var/val限定的是变量是否可读写，与可见性无关，即对外可见；public和private声明的才是可见性，但是在省略这些关键字时还是有默认值的，情况如下：

	如果只有var/val修饰，则字段总是对外可见的，即默认是public的
	如果连var/val也没有，则字段对外不可见，同时内部只读，不可改写，即默认是：private val

	第二条不适用于case class，case class的类参数在不指定val/var修饰时，会自动编译为public val，即对外只读，如果需要case class的字段外部可写，可以显式地指定var关键字！
	规则如下：

	对于var修饰的参数：外部可读/可改写 （实际上是：编译器为该类参数（字段）自动生成了getter和setter）
	对于val修饰的参数：外部可读/不可改写（实际上是：编译器为该类参数（字段）只生成了getter没有生成setter）
	对于private var修饰的参数：内部可读/可改写 （编译器不会为私有类参数（字段）自动生成getter和setter）
	对于private val修饰的参数：内部可读/不可改写 （编译器不会为该类参数（字段）自动生成getter和setter）
	
[走进Scala——伴生对象（Companion Object）](http://dreamhead.blogbus.com/logs/60217908.html)	
	
	准备涉水Scala的Java程序员请注意，Scala里没有static。在大多数情况下，static真不该是static的。像Scala这样想在面向对象上更进一步的程序设计语言，取消static是一种进取的表现，这样得以保证了其面向对象模型的完整性。好吧，我承认，有时候，我们还是需要类一级的属性和操作的。在Scala里，我们还是有机会的，这便是伴生对象（Companion Object）的作用。
	伴生对象本身就是一个Singleton，不同的是，它有一个与之同名的类（这里的class Companion），二者可以相互访问彼此的私有成员。
	
	
[ scala apply方法 笔记](http://blog.csdn.net/pzw_0612/article/details/48576569)	

	Scala程序特别要指出的是，单例对象会在第一次被访问的时候初始化。
	object apply 是一种比较普遍用法。 主要用来解决复杂对象的初始化问题。同时也是单例	
[ Scala中的None,Nothing,Null,Nil](http://blog.csdn.net/bluejoe2000/article/details/30465175)

	None是一个object，是Option的子类型
	scala推荐在可能返回空的方法使用Option[X]作为返回类型。如果有值就返回Some[x](Some也是Option的子类)，否则返回None
	Null是所有AnyRef的子类，在scala的类型系统中，AnyRef是Any的子类，同时Any子类的还有AnyVal。对应java值类型的所有类型都是AnyVal的子类。所以Null可以赋值给所有的引用类型(AnyRef)，不能赋值给值类型，这个java的语义是相同的。 null是Null的唯一对象。 
	Nothing是所有类型的子类，也是Null的子类。Nothing没有对象，但是可以用来定义类型。例如，如果一个方法抛出异常，则异常的返回值类型就是Nothing(虽然不会返回) 
	Nil是一个空的List，定义为List[Nothing]，根据List的定义List[+A]，所有Nil是所有List[T]的子类。	
	
[ Scala和并发编程](http://blog.csdn.net/fancylovejava/article/details/24724395)
	
	Scala就是这样，通过“使用基于事件的模型进行线程间通信”，并且“把不变对象作为消息进行传递”来实现一个并发编程模型。
	
	
[scala class和object的区别](http://blog.itpub.net/29754888/viewspace-1815301/)

	Scala中类对象中不可有静态变量和静态方法，但是提供了“伴侣对象”的功能：在和类的同一个文件中定义同名的Object对象：(须在同一文件中；main方法定义在Object对象中)
	


	
[scala入门之变量定义](http://my.oschina.net/fhd/blog/273952)

	scala有两种变量，val和var。val类似于Java里的final变量（字节码反编译成Java，其实就是final的变量）。一旦初始化了，val就不能再被赋值。相反，var如同Java里面的非final变量，可以在它的生命周期中被多次赋值。	
[Scala 函数调用 不加点号和括号](http://www.codeweblog.com/scala-%E5%87%BD%E6%95%B0%E8%B0%83%E7%94%A8-%E4%B8%8D%E5%8A%A0%E7%82%B9%E5%8F%B7%E5%92%8C%E6%8B%AC%E5%8F%B7/)

	省略括号
	如果一个方法不用接受参数，你可以无需括号就定义它。调用者也必须不加括号地调用它。如果你加上了空括号，那么调用者可以有选择地加或者不加括号。例如，List 的size 方法没有括号，所以你必须写List(1,2,3).size。如果你尝试写List(1,2,3).size() 就会得到一个错误	
	
	然而，String 类的length 方法在定义时带有括号，所以，"hello".length() 和"hello".length 都可以通过编译。
	Scala 社区的约定是，在没有副作用的前提下，省略调用方法时候的空括号。所以，查询一个序列的大小（size）的时候可以不用括号，	
	如果方法有0或1个参数，点和括号是可以丢掉的 
	a+b  ->  a.+(b)
	1 to 3 -> 1.to(3)
	
	
[Scala操作符的优先级和关联性](http://developer.51cto.com/art/200907/138014.htm)
	
	由于Scala没有操作符，实际上，是以操作符的格式使用方法的一个途径，你或许想知道操作符优先级是怎么做到的。Scala基于操作符格式里方法的第一个字符决定优先级（这个规则有一个例外，稍后再说）。比方说，如果方法名开始于*，那么就比开始于+的方法有更高的优先级。因此2 + 2 * 7将被评估为2 + (2 * 7)，而a +++ b *** c（这里a，b和c是值或变量，而+++和***是方法）将被看作是a +++ (b *** c)，因为***方法比+++方法有更高的优先级。
	
![image](http://images.51cto.com/files/uploadimg/20090721/0849250.jpg)


[Scala:fold,foldLeft和foldRight区别与联系](http://www.iteblog.com/archives/1228)

	由于fold函数遍历没有特殊的次序，所以对fold的初始化参数和返回值都有限制。在这三个函数中，初始化参数和返回值的参数类型必须相同。
	第一个限制是初始值的类型必须是list中元素类型的超类。在我们的例子中，我们的对List[Int]进行fold计算，而初始值是Int类型的，它是List[Int]的超类。
	第二个限制是初始值必须是中立的(neutral)。也就是它不能改变结果。比如对加法来说，中立的值是0；而对于乘法来说则是1，对于list来说则是Nil。	
	
	
[scala中的部分应用函数和偏函数的区别](http://my.oschina.net/aiguozhe/blog/49732)

	部分应用函数（Partial Applied Function)是缺少部分参数的函数，是一个逻辑上概念
	偏函数是只对函数定义域的一个子集进行定义的函数。 scala中用scala.PartialFunction[-T, +S]类来表示
	
	比如定义了一个函数：def sum(x: Int)(y: Int) = x + y, 当调用sum的时候，如果不提供所有的参数或某些参数还未知时，比如sum _ , sum(3)(_: Int), sum(_: Int)(3), 这样就生成了所谓的部分应用函数。部分应用函数只是逻辑上的一个表达，scala编译器会用Function1， Function2这些类来表示它.  
	
[scala 偏函数](http://blog.csdn.net/yyywyr/article/details/50277493)
	 
	 偏函数：当函数有多个参数，而在使用该函数时不想提供所有参数（比如函数有3个参数），只提供0~2个参数，此时得到的函数便是偏函数。