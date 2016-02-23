# 使用HttpOnly提升Cookie安全性

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/cookie_http_only.png)

HttpOnly就是在设置cookie一个参数，一旦被设置，在浏览器的document对象中就看不到cookie了。而浏览器在浏览网页的时候不受任何影响，因为Cookie会被放在浏览器头中发送出去(包括Ajax的时候)，应用程序也一般不会在JS里操作这些敏感Cookie的，对于一些敏感的Cookie我们采用HttpOnly，对于一些需要在应用程序中用JS操作的cookie我们就不予设置，这样就保障了Cookie信息的安全也保证了应用。简单的说HTTPOnly用来防御XSS对关键Cookie信息的窃取。我们官网的login_aliyunid_ticket就设置了这个安全属性。但HttpOnly并不是万能的。

1. 某些版本的浏览器出现过安全漏洞，导致可以用javascript覆盖cookie的HttpOnly属性。
2. 另外一些应用端的漏洞也可能会导致这些敏感的Cookie的泄露。显著例子就是phpinfo，phpinfo会将浏览器发送的http头回显出来，其中就包括我们保护的auth信息，而这个页面经常存在在各种站点上，只要用ajax取phpinfo页面，取出header头对应的部分就可以获得Cookie了。一些应用程序的不完善也可能导致header头的泄露，这种攻击方式对于基本验证保护的页面一样可以攻击。




### 参考
[使用HttpOnly提升Cookie安全性](http://blog.csdn.net/zzzmmmkkk/article/details/10862949)

[浏览器中因cookie设置HttpOnly标志引起的安全问题](http://netsecurity.51cto.com/art/201404/435401.htm)
