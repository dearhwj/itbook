#  TCP创建用来listen的socket时使用的地址
原文地址:[http://blog.csdn.net/harryhare/article/details/71954701](http://blog.csdn.net/harryhare/article/details/71954701)


0.0.0.0

打开端口后，任意地址均可connect 这个端口

127.0.0.1

只有本机可以connect 这个端口，也就是通过回环网卡的请求

内网地址

所有通过内网网卡的请求，如果外界（通过路由？）把内网地址映射到公网地址（或者只是映射该端口），那么外界通过公网地址一样可以connect这个端口

