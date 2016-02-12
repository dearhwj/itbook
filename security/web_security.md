# WEB Security
[使用HttpOnly提升Cookie安全性](http://blog.csdn.net/zzzmmmkkk/article/details/10862949)

	HttpOnly主要是为了限制web页面程序的browser端script程序读取cookie， 实际是浏览器通过协议实现限制的，黑客可不会那么傻，肯定不会用HTTP协议来读取cookie，肯定是在socket层面写抓包程序，相当于写一个低于IE6版本的应用程序。  
	
[浏览器中因cookie设置HttpOnly标志引起的安全问题](http://netsecurity.51cto.com/art/201404/435401.htm)

	HttpOnly标志的引入是为了防止设置了该标志的cookie被JavaScript读取，但事实证明设置了这种cookie在某些浏览器中却能被JavaScript覆盖，可被攻击者利用来发动session fixation攻击。该问题被提出后，得到了相关厂商的响应
	
[cookie窃取和session劫持](http://blogread.cn/it/article/6919?f=sa)	