# RxJava响应式编程框架




### RxJava Essentials

In the RxJava world, we have four main players:Observable ，Observer ，Subscriber ,Subjects


Hot and cold ObservablesA hot Observable, typically, starts emitting items as soon as it is created, so any Observer who subscribes to this Observable may start observing the sequence somewhere in the middle. A cold Observable waits until an Observer subscribes to it before it begins to emit items, so such an Observer is guaranteed to see the whole sequence from the beginning.
The key concepts were:
1. Easy concurrency to better use their server's power 
2. Easy conditional asynchronous execution3. A proper way to escape the callback hell4. A reactive approach
In the RxJava world, we have four main players:
1. Observable 
2. Observer 
3. Subscriber 
4. Subjects
Observable 
1. Observable.from()：we create an Observable sequence from a list we already had2. Observable.just()：What if we already have a classic Java function and we want to transform it in an Observable? We could use the create() method



Subject = Observable + Observer

RxJava provides four different types of subjects:
1. PublishSubject 2. BehaviorSubject :BehaviorSubject is a subject that emits the most recent item it has observed and all subsequent observed items to each subscribed item:3. ReplaySubject :ReplaySubject buffers all items it observes and replays them to any Observer that subscribes4. AsyncSubject: AsyncSubject publishes only the last item observed to each Observer that has subscribed when the Observable complete

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