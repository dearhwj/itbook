# Cookie
[How do browser cookie domains work](http://stackoverflow.com/questions/1062963/how-do-browser-cookie-domains-work)

	Mapping this knowledge onto your questions, the following should apply:

	Cookie with Domain=.example.com will be available for www.example.com
	Cookie with Domain=.example.com will be available for example.com
	Cookie with Domain=example.com will be converted to .example.com and thus will also be available for www.example.com
	Cookie with Domain=example.com will not be available for anotherexample.com
	www.example.com will be able to set cookie for example.com
	www.example.com will not be able to set cookie for www2.example.com
	www.example.com will not be able to set cookie for .com
	And to set and read a cookie for/by www.example.com and example.com, set it for .www.example.com and .example.com respectively. But the first (.www.example.com) will only be accessible for other domains below that domain (e.g. foo.www.example.com or bar.www.example.com) where .example.com can also be accessed by any other domain below example.com (e.g. foo.example.com or bar.example.com).


[www 开头的域名和 Cookie-free](http://88250.b3log.org/articles/2015/10/19/1445234634721.html)

	Cookie-free 域名指的是请求时不发送 Cookie 的域名，要解决前面我们提到的静态资源请求时带 Cookie 的方法就是使用 Cookie-free 域名来 serve 静态资源文件。
	这个方法是最目前最普遍和有效的做法，大多数站点都是使用了和用户入口所在主域名完全独立的另一个域名来提供静态资源：

	无论用户入口是 hacpai.com 还是 www.hacpai.com，静态资源如果放在另一个域名上（比如 symphony-static.b3log.org），那么浏览器在请求这些静态资源时都不会带上 Cookie
	symphony-static.b3log.org 可以非常方便的做 CDN 加速，因为都是静态资源，不需要配置复杂的匹配策略或重写规则
	另外，Cookie 最好只设置在当前域名下，不要设置在裸域上，避免不必要的“污染”。当然， 有的场景下，“污染”是为了以最简单的方式实现某些特性，比如多个子站通过裸域会话追踪的 Cookie 实现会话共享。