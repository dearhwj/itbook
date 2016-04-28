# Lynx纯文字终端网页浏览器

更新时间：2016年4月28日

Unix/Linux下有一款纯文字终端网页浏览器，不支持CSS、Image、Flash，只能显示文本。效果如下图

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/lynx_brower.png)

虽然，lynx不能显示CSS、Image、Flash这些高级货，但它可以显示文字,以及跟踪URL链接。

那么问题来了，这个神奇的玩意有啥用处呢？ 我们的生产环境和我们的办公网是隔离的，也就是说我们不可能通过我们的开发机访问内部的一些server的HTTP服务，或者说对访问的IP做了白名单只能从特定的IP发起请求，在这些环境里面没有ie chrome firefox。但lynx说不定能帮上你。以前做系统的时候会留一些后门，把这些后门的链接都放到一个page里面，需要处理问题的时候，就用lynx打开这个url，触发相应的URL（后门）
