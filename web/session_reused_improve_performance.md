# 重用Session提高https性能


## Session ID重用

　　重用一个加密的会话是很容易，前提是客户端和服务器端都保存了会话key，通过每个连接给出的唯一标识，服务器知道一个进来的连接是否已经在之前创建过，如果服务器在会话中也已经有会话key，它就能重用。Session ID需要服务器保存会话状态如会话key等，这样下次连接才能复用，这就需要服务器保存很多状态信息，耗费了大量内存。Session ID共享复用在Apache中可以通过SSLSessionCache 配置，在nginx可以通过ssl_session_cache设置。
　　
　　TLS连接时可以复用Session ID，可以减少一个来回的过程。服务器使用了负载均衡，一个域名对应了多个ip，会根据服务器的负载情况动态调整。Session ID A是保存在服务器A上的，服务器B没有Session ID A的记录。就导致了Session ID复用的失效。可以考虑在使用负载均衡时Session ID由一台服务器统一创建，并分发到其他服务器，这样就不会导致复用失效的问题。

## Session ticket重用

　　在会话ticket复用中，服务器不用为每个session保存状态，它用一个blob数据保存状态，然后将它发给客户端用来维护后来连接，会话ticket允许服务器将其存储状态委托给客户端，类似HTTP cookie一样。一个会话ticket是一个加密的数据blob，其中包含需要重用的TLS连接信息，如会话key等，它一般是使用ticket key加密，因为ticket key服务器端也知道，在初始握手中服务器发送一个会话ticket到客户端，存储到客户端本地，当重用会话时，客户端发送会话ticket到服务器，服务器解密然后重用会话。
　　
## Session Ticket的安全考虑

　　会话ticket有潜在的安全问题，一些TLS加密组件如ECDHE-RSA-AES128-SHA256提供一个安全属性成为向前安全forward secrecy，如果黑客获得了服务器的证书私钥，他们也不能获得会话来破解。

　　使用TLS 会话ticket，偷窃了ticket key1后不会允许黑客来解密先前的会话，这是的ticket key非常有价值，为了保持向前安全forward secrecy, ticket key应该经常轮换。

　　会话ticket重用在Apache中可以用SSLTicketKeyDefault 配置，在nginx中使用ssl_session_tickets，它们都没有自动轮换ticket key的自动机制，只能通过重启apache nginx来重新加载或创建新的随机key。　　
　　
　　
### 参考资料
[重用Session提高https性能](http://www.jdon.com/performance/speeding-up-https-with-session-resumption.html)

[How often should TLS Session Ticket Keys be rotated?](https://security.stackexchange.com/questions/97303/how-often-should-tls-session-ticket-keys-be-rotated)


[TLS False Start究竟是如何加速网站的](https://segmentfault.com/a/1190000004003319)

[Nginx的Session-sticky技术的软件负载均衡方案原理](https://wenku.baidu.com/view/19b6774fa2161479171128e0.html)

[HTTPS重用Session ID与负载均衡](http://blog.csdn.net/myzlhh/article/details/50179229)