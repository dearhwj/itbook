# Hash碰撞的拒绝式服务攻击（HASH COLLISION DOS）

原文地址:[http://coolshell.cn/articles/6424.html](http://coolshell.cn/articles/6424.html)
这个安全弱点利用了各语言的Hash算法的“非随机性”可以制造出N多的value不一样，但是key一样数据，然后让你的Hash表成为一张单向链表，而导致你的整个网站或是程序的运行性能以级数下降（可以很轻松的让你的CPU升到100%）。


在Java里， Aa和BB这两个字符串的hash code(或hash key) 是一样的，也就是Collision ;我们就可以通过这两个种子生成更多的拥有同一个hash key的字符串。如：”AaAa”, “AaBB”, “BBAa”, “BBBB”。这是第一次迭代。其实就是一个排列组合，写个程序就搞定了。


要防守这样的攻击，有下面几个招：

* 打补丁，把hash算法改了。
* 限制POST的参数个数，限制POST的请求长度。
* 最好还有防火墙检测异常的请求。
* 不过，对于更底层的或是其它形式的攻击，可能就有点麻烦了。