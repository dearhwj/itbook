# JAVA网络编程
[获取本机的真实IP地址]("http://www.oschina.net/code/snippet_97126_1968")

[socket可以同时读写吗]("http://bbs.csdn.net/topics/40448793")

[java 中url类使用]("http://blog.csdn.net/witsmakemen/article/details/6989010")

[ JAVA socket 关于DNS 缓存]("http://blog.csdn.net/turkeyzhou/article/details/5510960")

	java.security.Security.setProperty方法设置安全属性networkaddress.cache.ttl的值（单位：秒
	如果将networkaddress.cache.ttl属性值设为-1，那么DNS缓存数据将永远不会释放。
	访问域名失败的原因可能是这个域名真的不存在，也可能是因为DNS服务器或是其他的硬件或软件的临时故障，因此，一般不能将这个域名错误信息一直保留。在Java中可以通过networkaddress.cache.negative.ttl属性设置保留这些信息的时间。
	
	
[Java Socket重要参数讲解]("http://www.cnblogs.com/ggjucheng/archive/2012/01/06/2314679.html")
 
	backlog
	TcpNoDelay
	SoLinger
	UrgentData和OOBInline
	SoTimeout
	KeepAlive
	SendBufferSize和ReceiveBufferSize
