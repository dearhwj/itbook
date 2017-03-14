# HTTP KMS

### HTTP访问

[一次完整的Http请求过程]("http://blog.csdn.net/ymjring/article/details/43564477")

[浏览器访问一个地址的过程]("http://wenku.baidu.com/view/cbfcb6d5b14e852458fb572a.html")

### HTTPS

[流量劫持躲避 HSTS 的 HTTPS 劫持]("http://www.cnblogs.com/index-html/p/https_hijack_hsts.html")

[HSTS]("http://baike.baidu.com/view/4723586.htm")

	HSTS（HTTP Strict Transport Security）国际互联网工程组织IETE正在推行一种新的Web安全协议
	HSTS的作用是强制客户端（如浏览器）使用HTTPS与服务器创建连接。

[互联网全站HTTPS的时代已经到来]("http://blog.jobbole.com/78042/")

[关于启用 HTTPS 的一些经验分享](“http://network.51cto.com/art/201512/499864.htm”)

	HTTPS 网页中加载的 HTTP 资源被称之为 Mixed Content(混合内容)，不同浏览器对 Mixed Content 有不一样的处理规则。



	现代浏览器(Chrome、Firefox、Safari、Microsoft Edge)，基本上都遵守了 W3C 的 Mixed Content 规范，将 Mixed Content 分为Optionally-blockable 和 Blockable 两类：

	Optionally-blockable 类 Mixed Content 包含那些危险较小，即使被中间人篡改也无大碍的资源。现代浏览器默认会加载这类资源，同时会在控制台打印警告信息。这类资源包括：

	通过  标签加载的图片(包括 SVG 图片);

	通过 <img> 标签加载的图片（包括 SVG 图片）；
	通过 <video> / <audio> 和 <source> 标签加载的视频或音频；
	预读的（Prefetched）资源；
	预读的(Prefetched)资源;

	除此之外所有的 Mixed Content 都是 Blockable，浏览器必须禁止加载这类资源。所以现代浏览器中，对于 HTTPS 页面中的 JavaScript、CSS 等 HTTP 资源，一律不加载，直接在控制台打印错误信息。




[HTTP协议与HTML表单（再谈GET与POST的区别）]("http://www.cnblogs.com/devil-91/archive/2012/05/11/2495266.html")

[使用相对Url无缝切换HTTP-HTTPS]("http://www.imkevinyang.com/2009/09/%E4%BD%BF%E7%94%A8%E7%9B%B8%E5%AF%B9url%E6%97%A0%E7%BC%9D%E5%88%87%E6%8D%A2http-https.html")

	<img src='//myimagehosting.com/images/myphoto.jpg' />
	这行代码如果放在HTTP的网页上，那么请求的资源就是HTTP://myimagehosting.com/images/myphoto.jpg，如果放在HTTPS上，则访问的资源就是HTTPS的。这样一来我们就无需为HTTP和HTTPS各自准备不同的网页了。

[canonical 标签介绍](http://www.chinaz.com/web/2011/0630/192530.shtml)

	rel=”canonical” 这个标签已经推出很久了，canonical 是 Google、雅虎、微软等搜索引擎一起推出的一个标签，它的主要作用是用来解决由于网址形式不同内容相同而造成的内容重复问题。这个标签对搜索引擎作用非常大，简单的说它可以让搜索引擎只抓取你想要强调的内容。

	举个简单的例子，来看下如下的网址：

	http://www.yzznl.cn/archives/2011-snow.html
	http://www.yzznl.cn/archives/2011-snow.html?comments=true
	http://www.yzznl.cn/archives/2011-snow.html?postcomment=true

	这三个网址形式不同，第一个才是我们想显示给搜索引擎和用户的网址，但是打开它们网站的内容却是相同的。一般像这种状况搜索引擎是很难分辨出来哪个才是网站主想要强调的网址，这样会直接造成搜索引擎在你的站里面收录到大量重复的内容，现在我们通过 canonical 标签就可以解决这些棘手的问题了。

	像上面的状况，我们只需要在网址的 head 区域添加如下代码：

	<link rel='canonical' href='http://www.yzznl.cn/archives/2011-snow.html' />
	这样的话 Google 等搜索引擎最终都会只收录 canonical 标签指定的这个网址，搜索引擎会将其它页面作为重复内容，这些重复的内容不再参与页面的权重分配（如 Google 的 PR 值）。