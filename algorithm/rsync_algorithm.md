# Rsync的同步算法

[https://coolshell.cn/articles/7425.html]


### 滚动校验(Rolling Checksum

Rsync中使用了一种滚动检验(Rolling Checksum)算法，用于快速计算数据块的检验值。它是一种弱校验算法，采用的是Mark Adler的adler-32校验，它的定义如下：

```
       a(k, l) = (∑Xi)  mod M   
       b(k, l) = (∑(l - i +1)Xi) mod M
       s(k, l) = a(k, l) + 216 b(k, l)
```       
上面公式中，s(k, l)表示数据块Xk, ..., Xl的滚动校验值，为了简化以及计算速度考虑，M取值为216。这种校验计算公式具有一个非常关键的特性，那就是后续校验值可以通过递推关系高效地计算获得。

```
      a(k+1, l+1) = (a(k, l) - Xk + Xl+1)) mod M
      b(k+1, l+1) = (b(k, l) - (l - k +1)Xk + a(k+1, l+1)) mod M
      s(k+1, l+1) = a(k+1, l+1) + 216 b(k+1, l+1)
```  

因此，给定X1, ..., Xn的校验值，X1以及Xn+1，我们就可以快速地计算出X2, ..., Xn+1校验值。这样，利用这种性质我们就可以高效地计算数据块连续校验值，大幅减少checksum计算量。dedup util中，我在CDC和Sliding-block文件分块处理中使用了该校验值算法，性能得到大幅提升



### 参考资料
[从实际应用的角度看Rsync是如何工作的](http://edu.gimoo.net/u/20080910/4b8bc65c33216.shtml)
[How Rsync Works A Practical Overview](https://rsync.samba.org/how-rsync-works.html)
[rsync 的核心算法](http://www.cnblogs.com/itech/archive/2012/09/01/2667154.html)