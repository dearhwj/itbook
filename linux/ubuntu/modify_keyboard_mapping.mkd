# ubuntu下修改键盘映射
原文地址[http://www.cnblogs.com/tianshupei88/p/5050240.html](http://www.cnblogs.com/tianshupei88/p/5050240.html)
```
!
! Swap Caps_Lock and Control_L
!
remove Lock = Caps_Lock
remove Control = Control_L
keysym Control_L = Caps_Lock
keysym Caps_Lock = Control_L
add Lock = Caps_Lock
add Control = Control_L
```