# HTTPS的设计过程

1. 浏览器支持的算法是有限的，更不能指望浏览器支持一种只有特定服务器端实现的特殊的加密算法。所以只能选用一些已有加密算法3DES、AES等等。
2. 服务器段支持的算法也是有限的，同样服务端也不可能发明一个加密算法的轮子，让浏览器去了解并执行。而且发明出来的加密算法也可能存在安全漏洞。所以只能选用一些已有加密算法3DES、AES等等。
3. 为了让浏览器和服务器端能对使用的加密算法达成共识。在SSL/TSL的握手过程中浏览器将自己支持的一套加密规则发送给网站。 网站从中选出一组加密算法与HASH算法，并将自己的身份信息以证书的形式发回给浏览器。证书里面包含了网站地址，加密公钥，以及证书的颁发机构等信息。 
4. 为了避免对称加密，可能因为密码泄露导致的问题，就要选用非对称加密。公钥公开以后，客户端用公钥进行加密，服务端用私钥来解密。
5. 中间人的攻击（Man-in-the-MiddleAttack）导致这个过程变复杂了。中间人可以在浏览器和服务器之间加一个proxy。把伪造的公钥给到浏览器，收到浏览器的数据以后用proxy的私钥解密，然后再利用正确的服务端的公钥加密以后发送给服务端。所以这个时候就要引入一些公认的第三方来验证。这个第三方就是CA(Certificate Authority)。采用https的服务器必须从CA （Certificate Authority）申请一个用于证明服务器用途类型的证书。该证书只有用于对应的服务器的时候，客户端才信任此主机。。证书可以由国际上公认的证书机构颁发，这些机构是公认的信任机构，一些验证证书的客户端应用程序：比如浏览器，邮件客户端等，对于这些机构颁发的证书完全信任。
6. 如何保证客户端持有的证书就是合法服务器的公钥。这个就涉及到证书的申请流程。
	7. 服务器生成一对密钥，私钥自己留着，公钥交给数字证书认证机构（CA）  
	8. CA进行审核，并用CA自己的私钥对服务器提供的公钥进行签名
	9. 客户端从CA获取证书（即服务器端公钥），用CA的公钥对签名的证书进行验证，比对一致，说明该服务器公钥确实是CA颁发的（得此结论有一个前提就是：客户端的CA公钥确实是CA的公钥，即该CA的公钥与CA对证书进行签名的私钥确实是一对。参照上文RSA签名中所论述的情况），而CA又作为权威机构保证该公钥的确是服务器端提供的，从而可以确认该证书中的公钥确实是合法服务器端提供的
	10. 为保证第3步中提到的前提条件，CA的公钥必须要安全地转交给客户端，因此，CA的公钥一般来说由浏览器开发商内置在浏览器的内部。于是，该前提条件在各种信任机制上，基本保证成立。
11. 接下来的一个问题是非对称加密的性能。参考[对称加密算法和非对称加密算法速度对比](http://blog.csdn.net/woshiaotian/article/details/46990899) 对称算法RSA 256是AES CBC 模式模式的1500倍。对称加密算法0.13秒而非对称加密算法需要193.16秒。解决的办法是将对称加密的密钥使用非对称加密的公钥进行加密，然后发送出去，接收方使用私钥进行解密得到对称加密的密钥，然后双方可以使用对称加密来进行沟通。
12. 那么这个对称密码的key怎么来呢，又不能事先固定好。https才有的是产生随机数的办法。 把随机数加密以后用公钥加密，传到服务器端，服务器端用私钥解密获取随机数。伺候使用都使用这个随机数进行对称加密。
13. 不能每次都进行SSL/TSL的握手过程。参考[HTTPS 要比 HTTP 多用多少服务器资源](https://www.zhihu.com/question/21518760)http使用TCP 三次握手建立连接，客户端和服务器需要交换3个包，https除了 TCP 的三个包，还要加上 ssl握手需要的9个包，所以一共是12个包。http 建立连接，按照下面链接中针对Computer Science House的测试，是114毫秒；https建立连接，耗费436毫秒。ssl 部分花费322毫秒，包括网络延时和ssl 本身加解密的开销（服务器根据客户端的信息确定是否需要生成新的主密钥；服务器回复该主密钥，并返回给客户端一个用主密钥认证的信息；服务器向客户端请求数字签名和公开密钥）.每次都进行	SSL/TSL性能不能接受。需要服务器端能保存https的session信息。这个就是Session Resume。TSL协议提供了两种机制实现Session Resume，分别是Session Cache和Session Ticket。Session Cache的原理是利用Session ID查询服务器的Session Cache，如命中直接使用缓存信息。但Session Cache不支持分布式缓存，只支持单机进程间的缓存共享，Session Ticket原理是把Session信息加密成ticket发送给浏览器，浏览器后续进行TLS握手的时候，会发送ticket，如果服务器能够解密和处理改ticket，则可以复用session。目前session ticket支持率不是很高。


## 图解HTTPS通信过程

原文地址：[http://www.liqwei.com/network/protocol/2012/906.shtml](http://www.liqwei.com/network/protocol/2012/906.shtml)

我们都知道HTTPS能够加密信息，以免敏感信息被第三方获取。所以很多银行网站或电子邮箱等等安全级别较高的服务都会采用HTTPS协议。

**HTTPS简介**

HTTPS其实是有两部分组成：HTTP + SSL / TLS，也就是在HTTP上又加了一层处理加密信息的模块。服务端和客户端的信息传输都会通过TLS进行加密，所以传输的数据都是加密后的数据。具体是如何进行加密，解密，验证的，且看下图。

![](http://cdn.liqwei.com/www/201211/20121130144420002.png)

**1. 客户端发起HTTPS请求**

这个没什么好说的，就是用户在浏览器里输入一个https网址，然后连接到server的443端口。

**2. 服务端的配置**

采用HTTPS协议的服务器必须要有一套数字证书，可以自己制作，也可以向组织申请。区别就是自己颁发的证书需要客户端验证通过，才可以继续访问，而使用受信任的公司申请的证书则不会弹出提示页面(startssl就是个不错的选择，有1年的免费服务)。这套证书其实就是一对公钥和私钥。如果对公钥和私钥不太理解，可以想象成一把钥匙和一个锁头，只是全世界只有你一个人有这把钥匙，你可以把锁头给别人，别人可以用这个锁把重要的东西锁起来，然后发给你，因为只有你一个人有这把钥匙，所以只有你才能看到被这把锁锁起来的东西。

**3. 传送证书**

这个证书其实就是公钥，只是包含了很多信息，如证书的颁发机构，过期时间等等。

**4. 客户端解析证书**

这部分工作是有客户端的TLS来完成的，首先会验证公钥是否有效，比如颁发机构，过期时间等等，如果发现异常，则会弹出一个警告框，提示证书存在问题。如果证书没有问题，那么就生成一个随即值。然后用证书对该随机值进行加密。就好像上面说的，把随机值用锁头锁起来，这样除非有钥匙，不然看不到被锁住的内容。

**5. 传送加密信息**

这部分传送的是用证书加密后的随机值，目的就是让服务端得到这个随机值，以后客户端和服务端的通信就可以通过这个随机值来进行加密解密了。

**6. 服务段解密信息**

服务端用私钥解密后，得到了客户端传过来的随机值(私钥)，然后把内容通过该值进行对称加密。所谓对称加密就是，将信息和私钥通过某种算法混合在一起，这样除非知道私钥，不然无法获取内容，而正好客户端和服务端都知道这个私钥，所以只要加密算法够彪悍，私钥够复杂，数据就够安全。

**7. 传输加密后的信息**

这部分信息是服务段用私钥加密后的信息，可以在客户端被还原

**8. 客户端解密信息**

客户端用之前生成的私钥解密服务段传过来的信息，于是获取了解密后的内容。整个过程第三方即使监听到了数据，也束手无策。


## 参考
[重用Session提高https性能](http://www.jdon.com/performance/speeding-up-https-with-session-resumption.html)

[Session ticket关联TLS流方法分析](http://blog.csdn.net/javajiawei/article/details/51331768)

[传输层安全协议抓包分析之SSL/TLS](http://www.open-open.com/lib/view/open1476514605355.html)

[HTTPS 要比 HTTP 多用多少服务器资源？](https://www.zhihu.com/question/21518760)

[nginx 学习笔记(9) 配置HTTPS服务器--转载](http://www.cnblogs.com/davidwang456/p/3428261.html)

[浅谈https\ssl\数字证书](http://www.cnblogs.com/zxj015/p/4458066.html)

[大型网站的HTTPS实践（一）---HTTPS协议和原理](http://blog.csdn.net/luocn99/article/details/45460673)

[https原理](http://blog.csdn.net/sunmenggmail/article/details/10013473)

[HTTPS 原理解析](http://www.cnblogs.com/zery/p/5164795.html)

[理解 HTTPS 原理，SSL/TLS 协议](http://88250.b3log.org/articles/2015/11/19/1447920990604.html)
