# Python父类构造函数初始化
原文地址:[http://blog.csdn.net/xiemanR/article/details/69390187?locationNum=6&fps=1](http://blog.csdn.net/xiemanR/article/details/69390187?locationNum=6&fps=1)


python子类调用父类初始化函数有两种方式，以下代码在python2和python3都能运行：


```
class A(object):
    def __init__(self, x):
        self.x = x

# 方法一
class B(A):
    def __init__(self, x, y):
        A.__init__(self, x)
        self.y = y

# 方法二
class C(A):
    def __init__(self, x, y):
        super(C, self).__init__(x)
        self.y = y

b = B('foo', 'bar')
c = C('foo', 'bar')
print(b.x, b.y)
print(c.x, c.y)

```

python2：
第二方法，在python2中父类A要继承objectt类，否则会出错：
```
>>> class A:
    def __init__(self, x):
        self.x = x

>>> class C(A):
    def __init__(self, x, y):
        super(C, self).__init__(x)
        self.y = y

>>> c = C('foo', 'bar')

Traceback (most recent call last):
  File "<pyshell#167>", line 1, in <module>
    b = B('foo', 'bar')
  File "<pyshell#166>", line 3, in __init__
    super(B, self).__init__(x)
TypeError: super() argument 1 must be type, not classobj
>>> 

```
python3：
第二方法，在python3中父类A可以不继承object，因为python3中类都是默认继承object的：
```
>>> class A:
    def __init__(self, x):
        self.x = x

>>> class C(A):
    def __init__(self, x, y):
        super(C, self).__init__(x)
        self.y = y

>>> c = C('foo', 'bar')
>>> print(c.x, c.y)
foo bar
>>>

其中super的参数可以省略，代码简化为：

>>> class A:
    def __init__(self, x):
        self.x = x

>>> class C(A):
    def __init__(self, x, y):
        super().__init__(x)
        self.y = y

>>> c = C('foo', 'bar')
>>> print(c.x, c.y)
foo bar
>>>

```