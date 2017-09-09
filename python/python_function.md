# Python Function


##关键字参数

关键字参数是实参里面的概念，在调用函数的时候声明某个参数是属于某个关键字的。使用关键字参数允许函数调用时参数的顺序与声明时不一致，因为 Python 解释器能够用参数名匹配参数值。

举个栗子：
```
def f(name,age):
     print(name,age)
     f(name="小明",18)
```



## 函数返回多值
```
import math
def move(x, y, step, angle):
    nx = x + step * math.cos(angle)
    ny = y - step * math.sin(angle)
    return nx, ny
     
print(move(100, 100, 60, math.pi / 6))
　　
```
但其实这只是一种假象，Python函数返回的仍然是单一值：
```
>>> r = move(100, 100, 60, math.pi / 6)
>>> print r
(151.96152422706632, 70.0)
```
用print打印返回结果，原来返回值是一个tuple！
但是，在语法上，返回一个tuple可以省略括号，而多个变量可以同时接收一个tuple，按位置赋给对应的值，所以，Python的函数返回多值其实就是返回一个tuple，但写起来更方便。

