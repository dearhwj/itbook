# Python中yield与with的配合
原文[http://blog.csdn.net/u013213434/article/details/42554161](http://blog.csdn.net/u013213434/article/details/42554161)

yield的作用是使所在的函数变成一个生成器，可以用next()函数来执行，并在遇到yield后中断，再次调用next()的时候，函数接着上次执行，并在遇到yield后再次中断。如果执行到最后没有yield语句了，就会抛出一个StopIteration的异常。关于yield的资料，网上有很多，大家可以自行搜索。

with是一个控制流语句，我看到最多的用法就是用来简化异常处理的情况。关于with的用法，可以参见http://effbot.org/zone/python-with-statement.htm

我这里想说的是，with和yield一起使用的情况。我们知道，with后面接的类必须要有一个__enter__()函数和一个__exit__()函数。而contextlib.contextmanager可以把函数装饰成带有__enter__()和__exit__()的类。以下面的代码为例：

``` 

from contextlib import contextmanager

@contextmanager
def make_context():
    print 'enter'
    try:
        yield 1
        print "I'm between two yield"
    except Exception:
        print "here is excepted"


with make_context() as value:
    print value
    raise Exception

``` 

虽然make_context()是一个函数，但是由于它被contextmanager装饰了，所以现在with后面其实是一个上下文的类，而这个类的__enter__()函数的主体是make_context.next()，__exit__()的主要代码是make_context.next()。所以，当执行的时候，首先执行make_context.next()，输出“enter” 。然后执行到yield，这时这个函数就中断了，回过来执行with里body里的代码，由于我们接收了yield返回的值，所以输出“ 1  ”。然后我们抛出异常，with的body就执行完了。

 

接着我们进入__exit__()函数，也就是再执行一次make_context.next()函数。这里就是最神奇的地方了，虽然这两段代码没有在一个函数体里，但是__exit__()函数可以捕捉到with的body里的异常，所以我们进入了make_context函数的except里，并打印出“  here is excepted ”。

 
with和yield配合在一起，确实省了不少事，这样，如果想处理同一类异常的时候，我们不用在每个函数里都加入多个try...catch块，而只需要在代码块前加一个with表达式即可。

