# Python namedtuple 用法

原文地址:[http://www.jb51.net/article/87059.htm](http://www.jb51.net/article/87059.htm)

namedtuple能够用来创建类似于元祖的数据类型，除了能够用索引来访问数据，能够迭代，更能够方便的通过属性名来访问数据。
在python中，传统的tuple类似于数组，只能通过下标来访问各个元素，我们还需要注释每个下标代表什么数据。通过使用namedtuple，每个元素有了自己的名字，类似于C语言中的struct，这样数据的意义就可以一目了然了。当然，声明namedtuple是非常简单方便的。
代码示例如下：

```
from collections import namedtuple
  
Friend=namedtuple("Friend",['name','age','email'])
  
f1=Friend('xiaowang',33,'xiaowang@163.com')
print(f1)
print(f1.age)
print(f1.email)
f2=Friend(name='xiaozhang',email='xiaozhang@sina.com',age=30)
print(f2)
  
name,age,email=f2
print(name,age,email)

``` 
类似于tuple，它的属性也是不可变的：

```
>>> big_yellow.age += 1
Traceback (most recent call last):
 File "<stdin>", line 1, in <module>
AttributeError: can't set attribute

```
能够方便的转换成OrderedDict:

>>> big_yellow._asdict()
OrderedDict([('name', 'big_yellow'), ('age', 3), ('type', 'dog')])
方法返回多个值得时候，其实更好的是返回namedtuple的结果,这样程序的逻辑会更加的清晰和好维护：

```

>>> from collections import namedtuple
>>> def get_name():
...   name = namedtuple("name", ["first", "middle", "last"])
...   return name("John", "You know nothing", "Snow")
...
>>> name = get_name()
>>> print name.first, name.middle, name.last
John You know nothing Snow
```