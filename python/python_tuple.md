# Python元组(tuple)


## 看看三者最基本的区别：
List是顺序的,可变的.
Dictrionary是无顺序的,可变的.Dictionary是内置数据类型之一,它定义了键和值之间一对一的关系.每一个元素都是一个 key-value 对,整个元素集合用大括号括起来.
Tuple 是顺序的,不可变 list.一旦创建了一个 tuple 就不能以任何方式改变它.

定义 tuple 与定义 list 的方式相同,除了整个元素集是用小括号包围的而不是方括号

你说的对,Tuple 是不可变 list.一旦创建了一个 tuple 就不能以任何方式改变它.



## Tuple 与 list 的相同之处

 定义 tuple 与定义 list 的方式相同,除了整个元素集是用小括号包围的而不是方括号.
Tuple 的元素与 list 一样按定义的次序进行排序.Tuples 的索引与 list 一样从 0 开始,所以一个非空 tuple 的第一个元素总是 t[0].
负数索引与 list 一样从 tuple 的尾部开始计数.
与 list 一样分片 (slice) 也可以使用.注意当分割一个 list 时,会得到一个新的 list ；当分割一个 tuple 时,会得到一个新的 tuple.

## Tuple 不存在的方法
您不能向 tuple 增加元素.Tuple 没有 append 或 extend 方法.
您不能从 tuple 删除元素.Tuple 没有 remove 或 pop 方法.
您不能在 tuple 中查找元素.Tuple 没有 index 方法.
然而,您可以使用 in 来查看一个元素是否存在于 tuple 中.

## 用 Tuple 的好处

Tuple 比 list 操作速度快.如果您定义了一个值的常量集,并且唯一要用它做的是不断地遍历它,请使用 tuple 代替 list.
如果对不需要修改的数据进行 “写保护”,可以使代码更安全.使用 tuple 而不是 list 如同拥有一个隐含的 assert 语句,说明这一数据是常量.如果必须要改变这些值,则需要执行 tuple 到 list 的转换.


## Tuple 与 list 的转换
Tuple 可以转换成 list,反之亦然.内置的 tuple 函数接收一个 list,并返回一个有着相同元素的 tuple
而 list 函数接收一个 tuple 返回一个 list.从效果上看,tuple 冻结一个 list,而 list 解冻一个 tuple.


## Tuple的操作
一次赋多值

```
>>> v = ('a','b','e')
>>> (x,y,z) = v

```

连接 tuple

```
tup1 = (12, 34.56);
tup2 = ('abc', 'xyz');
tup3 = tup1 + tup2;
```

删除元组

元组中的元素值是不允许删除的，但我们可以使用del语句来删除整个元组

```
tup = ('physics', 'chemistry', 1997, 2000);
print tup;
del tup;

```

Python元组包含了以下内置函数

1. cmp(tuple1, tuple2)：比较两个元组元素。
2. len(tuple)：计算元组元素个数。
3. max(tuple)：返回元组中元素最大值。
4. min(tuple)：返回元组中元素最小值。
5. tuple(seq)：将列表转换为元组。