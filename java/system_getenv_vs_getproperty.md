# System.Properties和System.getenv区别
原文地址：[http://blog.csdn.net/lanwenbing/article/details/40780971](http://blog.csdn.net/lanwenbing/article/details/40780971)


网上很多使用的是getProperties。说获得系统变量，但是其实不正确。getProperties中所谓的"system properties"其实是指"java system"，而非"operation system"，概念完全不同，使用getProperties获得的其实是虚拟机的变量形如： -Djavaxxxx。

getenv方法才是真正的获得系统环境变量，比如Path之类。其方法命名方式有违Sun命名规范其实。