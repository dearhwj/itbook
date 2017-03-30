# CAS(Compare And Swap)原理


## CAS原语
LL/SC, atom read-modify-write
如果CPU提供了Load-Link/Store-Conditional（LL/SC）这对指令，则就可以轻松实现变量的CPU级别无锁同步。
LL [addr],dst：从内存[addr]处读取值到dst。
SC value,[addr]：对于当前线程，自从上次的LL动作后内存值没有改变，就更新成新值。
上述过程就是实现lock-free的 read-modify-write 的原子操作。
 
CAS （Compare-And-Swap）
LL/SC这对CPU指令没有实现，那么就需要寻找其他算法，比如CAS。
CAS是一组原语指令，用来实现多线程下的变量同步。
在 x86 下的指令CMPXCHG实现了CAS，前置LOCK既可以达到原子性操作。截止2013，大部分多核处理器均支持CAS。
CAS原语有三个参数，内存地址，期望值，新值。如果内存地址的值==期望值，表示该值未修改，此时可以修改成新值。否则表示修改失败，返回false，由用户决定后续操作。


## 语言实现
```
AtomicInteger atom = new AtomicInteger(1);
boolean r = atom.compareAndSet(1, 2);
 
```



## 参考资料

[无锁编程以及CAS](http://www.cnblogs.com/caca/p/lock-free_CAS_ABA.html)
