# Python的魔幻语法

## magic and/or

python 中的and从左到右计算表达式，若所有值均为真，则返回最后一个值，若存在假，返回第一个假值。or也是从左到有计算表达式，返回第一个为真的值。

```
>>>'a'and'b'
'b'
>>>''and'b'
''
>>>'a'or'b'
'a'
>>>''or'b'
'b'

```


## magic if

```
cookies = self.cookies if self.account is None else None 
```

上面这段语句怎么理解？

A = Y if X else Z

如果X为真，那么就执行A=Y

如果X为假，就执行A=Z


## magic array

```
c = [b,a][a>b]  //如果a>b返回a，否则返回b
>>> a = 1
>>> b = 2
>>> c = [b,a][a>b]
>>> c
2

```

## magic for
```
c = [ i for i in a if i%2==0 ]  //遍历a，在i为偶数时返回
>>> a = [1,2,3]
>>> c = [i for i in a if i%2==0]
>>> c
[2]

```

```

c = [i+j for i in a for j in b if i%2==0 and j%2==0]    //同时嵌套遍历列表a和b，返回i和j同时为偶数时的和。其中for in a属于外层嵌套，for in b属于内层
>>> a = [1,2,3]
>>> b = [4,5,6]
>>> c = [i+j for i in a for j in b if i%2==0 and j%2==0]
>>> c
[6, 8]

```

```
c = [i if i%2==0 else 1 for i in a]  //遍历a，如果i为偶数直接返回，否则直接返回1。此处if写在for前面要求必须有else项
>>> a = [1,2,3]
>>> c = [i if i%2==0 else 1 for i in a]
>>> c
[1, 2, 1]
```


## magic assignment

```
a,b=b,a   //交换数据
>>> a=1
>>> b=2
>>> a,b=b,a
>>> a
2
>>> b

```

## magic join

```
''.join['1','2']  //字符list的连接
>>> c = ''.join(['1','2'])
>>> c
'12'
```
