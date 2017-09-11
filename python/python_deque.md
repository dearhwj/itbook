# Python Deque 操作
Deque模块是Python标准库collections中的一项. 它提供了两端都可以操作的序列, 这意味着, 你可以在序列前后都执行添加或删除.

创建Deque序列:

```
from collections import deque
d=deque()
```

Deque提供了类似list的操作方法:

```
d=deque()
d.append(1)
d.append(2)
d.append(3)
len(d)
d[0]
d[-1]
```
输出结果:
```
3
1
3

```

两端都使用pop:

```
d=deque(12345)
len(d)
d.popleft()
d.pop()

```
输出结果:
```
5
1
5
deque([2, 3, 4])
```

我们还可以限制deque的长度:

```
d = deque(maxlen=30)
```
当限制长度的deque增加超过限制数的项时, 另一边的项会自动删除:

```
d=deque(maxlen=2)

d.append(1)
d.append(2)
d.append(3)

deque([1, 2], maxlen=2)
deque([2, 3], maxlen=2)

```
添加list中各项到deque中:

```
d=deque([1,2,3,4,5])
d.extendleft([0])
d.extend([6,7,8])
```
输出结果:

```
deque([0, 1, 2, 3, 4, 5, 6, 7, 8])
```