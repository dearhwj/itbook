# Scala Tips
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