# RxJava响应式编程框架

### 资源

[RxJava 初探](http://www.tuicool.com/articles/VrQRvur)

	一般响应式编程的信息流如下所示：
	Observable -> Operator 1 -> Operator 2 -> Operator 3 -> Subscriber
	也就是说，observable是事件的生产者，subscriber是事件最终的消费者。
	因为subscriber通常在主线程中执行，因此设计上要求其代码尽可能简单，只对事件进行响应，而修改事件的工作全部由operator执行。
	
	在开发过程中，为了避免阻塞UI线程，我们可能需要将某些工作放到指定线程执行。在RxJava中，你可以通过subscribeOn()来指定Observer的运行线程，通过observeOn()指定Subscriber的运行线程

[ReactiveX中文文档翻译](https://mcxiaoke.gitbooks.io/rxdocs/content/index.html)


[RxJava Wiki Home](https://github.com/ReactiveX/RxJava/wiki)

[深入浅出RxJava（一：基础篇）](http://blog.csdn.net/lzyzsd/article/details/41833541)

[深入浅出RxJava(二：操作符)](http://blog.csdn.net/lzyzsd/article/details/44094895)

[深入浅出RxJava三--响应式的好处](http://blog.csdn.net/lzyzsd/article/details/44891933)