# HTTPS Optimization

## Session ID复用    
TLS连接时可以复用Session ID，可以减少一个来回的过程。服务器使用了负载均衡，一个域名对应了多个ip，会根据服务器的负载情况动态调整。Session ID A是保存在服务器A上的，服务器B没有Session ID A的记录。就导致了Session ID复用的失效。可以考虑在使用负载均衡时Session ID由一台服务器统一创建，并分发到其他服务器，这样就不会导致复用失效的问题。


## Session-sticky


### 参考资料

[TLS False Start究竟是如何加速网站的](https://segmentfault.com/a/1190000004003319)

[Nginx的Session-sticky技术的软件负载均衡方案原理](https://wenku.baidu.com/view/19b6774fa2161479171128e0.html)

[HTTPS重用Session ID与负载均衡](http://blog.csdn.net/myzlhh/article/details/50179229)