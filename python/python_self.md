# Python Self


### self代表类的实例，而非类
```

class Test:
    def prt(self):
        print(self)
        print(self.__class__)
 
t = Test()
t.prt()


```


### self不必非写成self

有很多童鞋是先学习别的语言然后学习Python的，所以总觉得self怪怪的，想写成this，可以吗？

当然可以，还是把上面的代码改写一下。

```
class Test:
    def prt(this):
        print(this)
        print(this.__class__)


t = Test()
t.prt()
```
改成this后，运行结果完全一样。当然，最好还是尊重约定俗成的习惯，使用self。

### self可以不写吗
在Python的解释器内部，当我们调用t.prt()时，实际上Python解释成Test.prt(t)，也就是说把self替换成类的实例。

t.prt()等同于Test.prt(t)，所以程序提醒我们多传了一个参数t。

```
Traceback (most recent call last):
  File "h.py", line 6, in <module>
    t.prt()
TypeError: prt() takes 0 positional arguments but 1 was given
```

当然，如果我们的定义和调用时均不传类实例是可以的，这就是类方法。



### 在描述符类中，self指的是描述符类的实例

```

class Desc:
    def __get__(self, ins, cls):
        print('self in Desc: %s ' % self )
        print(self, ins, cls)
class Test:
    x = Desc()
    def prt(self):
        print('self in Test: %s' % self)
t = Test()
t.prt()
t.x

````


### 总结

* self在定义时需要定义，但是在调用时会自动传入。
* self的名字并不是规定死的，但是最好还是按照约定是用self
* self总是指调用时的类的实例。


### 参考
[一篇文章让你彻底搞清楚Python中self的含义](http://python.jobbole.com/81921/)