# Python FAQ

## Python的常见问题


### python中and和or的用法

python 中的and从左到右计算表达式，若所有值均为真，则返回最后一个值，若存在假，返回第一个假值。


or 也是从左到有计算表达式，返回第一个为真的值。


and 和 or 运算的一条重要法则：短路计算。

1. 在计算 a and b 时，如果 a 是 False，则根据与运算法则，整个结果必定为 False，因此返回 a；如果 a 是 True，则整个计算结果必定取决与 b，因此返回 b。

2. 在计算 a or b 时，如果 a 是 True，则根据或运算法则，整个计算结果必定为 True，因此返回 a；如果 a 是 False，则整个计算结果必定取决于 b，因此返回 b。




```
>>>'a'and'b'
'b'

>>> ''or'b'
'b'
```

### Python中布尔类型

因为Python把0、空字符串''和None看成 False，其他数值和非空字符串都看成 True，所以：



### python 中的"_,"问题

```

cmd_name = argv[1]
cmd = xm_lookup_cmd(cmd_name)
if cmd:
# strip off prog name and subcmd
args = argv[2:]
_, rc = _run_cmd(cmd, cmd_name, args)
sys.exit(rc)
else:
err('Subcommand %s not found!' % cmd_name)
usage()
其中的一行： _, rc = _run_cmd(cmd, cmd_name, args)
中的"_,"，是什么意思？

```


在python中，所有标识符可以包括英文、数字以及下划线（_），但不能以数字开头。python中的标识符是区分大小写的。


但是通常python的变成习惯以下划线开头的标识符是有特殊意义的。以单下划线开头（_foo）的代表不能直接访问的类属性，需通过类提供的接口进行访问，不能用“from xxx import *”而导入；以双下划线开头的（__foo）代表类的私有成员；以双下划线开头和结尾的（__foo__）代表python里特殊方法专用的标识，如__init__（）代表类的构造函数。
在交互模式下运行python时，一个下划线字符(_)是特殊标识符，它保留了表达式的最后一个计算结果。

### Converting Python dict to kwargs?

Use the double-star (aka double-splat?) operator:

```
func(**{'type':'Event'})
is equivalent to

func(type='Event')
```

### 【Python】KeyError解决方法
原文:[http://blog.csdn.net/investchina/article/details/21177333](http://blog.csdn.net/investchina/article/details/21177333)
如果不知道dict中是否有key的值  
  
dict.get(key)  
  
#如果用 dict[key] 读取会报KeyError异常  


_就是一个变量，换成a也是可以的，没有特别的意思，不过一般用_表示的变量好像都是没什么用的一个临时变量，大概是一个编程习惯吧。


### 日期格式化

```
>>> datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S');
'2013-09-17 08:06:17'

```
