#  Python String 操作


## 字符串块

Python有一种三重引号内的字符串常量格式，有时候称为块字符串。这是一种对编写多行文本数据来说很便捷的说法。这个形式以三重引号开始，并紧跟任意行数的文本，并且以开始时的同样的三重引号结尾。

```
a="""
...     b
...     c
... """

>>>a
'\n\tb\n\tc\n'

```




### python字符串连接的三种方法及其效率、适用场景详解

方法1：直接通过加号(+)操作符连接

```
website = 'python' + 'tab' + '.com'
```

方法2：join方法

```
listStr = ['python', 'tab', '.com'] 
website = ''.join(listStr)

```

方法3：替换

```
website = '%s%s%s' % ('python', 'tab', '.com')
```
