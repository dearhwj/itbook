# 获取用户Ip地址通用方法以及常见安全隐患

原文地址:[http://www.cnblogs.com/chengmo/archive/2013/05/29/php.html](http://www.cnblogs.com/chengmo/archive/2013/05/29/php.html)

### 获取用户访问IP的办法
这个是网上常见获取，ip函数，用这些值获取IP,我们首先要弄清楚，这些数据是从那个地方传过来的。
	
	
	function getIP() { 
	if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) { 
		$realip = $_SERVER['HTTP_X_FORWARDED_FOR']; 
	} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) { 
		$realip = $_SERVER['HTTP_CLIENT_IP']; 
	} else { 
		$realip = $_SERVER['REMOTE_ADDR']; 
		} 
		return $realip; 
	}
	
1. REMOTE_ADDR  是远端IP，默认来自tcp 连接是，客户端的Ip。可以说，它最准确，确定是，只会得到直接连服务器客户端IP。如果对方通过代理服务器上网，就发现。获取到的是代理服务器IP了。如：a->b(proxy)->c  ,如果c 通过’REMOTE_ADDR’ ，只能获取到b的IP,获取不到a的IP了。另外:该IP想篡改将很难实现，在传递知道生成php server值，都是直接生成的。

2. HTTP_X_FORWARDED_FOR，HTTP_CLIENT_IP 为了能在大型网络中，获取到最原始用户IP，或者代理IP地址。对HTTp协议进行扩展。定义了实体头。HTTP_X_FORWARDED_FOR = clientip,proxy1,proxy2  所有IP用”,”分割。 最左边(client1)是最原始客户端的IP地址, 代理服务器每成功收到一个请求，就把请求来源IP地址添加到右边。 在上面这个例子中，这个请求成功通过了两台代理服务器：proxy1, proxy2 请求由client1发出，请求刚从client1中发出时，XFF是空的，请求被发往proxy1；通过proxy1的时候，client1被添加到XFF中，之后请求被发往proxy2;通过proxy2的时候，proxy1被添加到XFF中。鉴于伪造这一字段非常容易，应该谨慎使用X-Forwarded-For字段。正常情况下XFF中最后一个IP地址是最后一个代理服务器的IP地址, 这通常是一个比较可靠的信息来源。 HTTP_CLIENT_IP 在高级匿名代理中，这个代表了代理服务器IP。既然是http协议扩展一个实体头，并且这个值对于传入端是信任的，信任传入方按照规则格式输入的。以下以x_forword_for例子加以说明，正常情况下，这个值变化过程。



### 分析Bug风险点

通过刚刚分析我们发现，其实这些变量，来自http请求的：x-forword-for字段，以及client-ip字段。 正常代理服务器，当然会按rfc规范来传入这些值。但是，当一个用户直接构造该x-forword-for值，发送给用户用户，那将会怎么样呢？

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/http_x_forward_inject.png)



x-forwarded-for不光可以自己设置值，而且可以设置任意格式值。 这样一来，好比就直接有一个可以写入任意值的字段。并且服务器直接读取，或者写入数据库，或者做显示。它将带来危险性，跟一般对入输入没有做任何过滤检测，之间操作数据源结果一样。 并且容易带来隐蔽性。



上面getip函数，除了客户端可以任意伪造IP，并且可以传入任意格式IP。 这样结果会带来2大问题，其一，如果你设置某个页面，做IP限制。 对方可以容易修改IP不断请求该页面。 其二，这类数据你如果直接使用，将带来SQL注册，跨站攻击等漏洞。至于其一，可以在业务上面做限制，最好不采用IP限制。 对于其二，这类可以带来巨大网络风险。我们必须加以纠正。需要对getip 进行修改，得到安全的getip函数。

[http://www.jb51.net/article/21161.htm](http://www.jb51.net/article/21161.htm)  同样讲了一个 HTTP_X_FORWARDED_FOR获取客户端IP导致SQL注入的漏洞

	string sql = "INSERT INTO (IP) VALUE ('" + IP + "')"; 
	那么也许破坏者还可以进行SQL注入进行数据破坏!! 


### 结论
1. web参数检测里面一个基本原则：“一切输入都是有害的”，因此，只要是输入我们就需要进行过滤。
2. 业务上不要依赖IP进行限制或业务操作
