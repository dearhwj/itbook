
# CSRF跨站请求伪造

[百度词条](http://baike.baidu.com/view/1609487.htm)

CSRF（Cross-site request forgery跨站请求伪造，也被称为“One Click Attack”或者Session Riding，通常缩写为CSRF或者XSRF，是一种对网站的恶意利用。尽管听起来像跨站脚本（XSS），但它与XSS非常不同，并且攻击方式几乎相左。XSS利用站点内的信任用户，而CSRF则通过伪装来自受信任用户的请求来利用受信任的网站。与XSS攻击相比，CSRF攻击往往不大流行（因此对其进行防范的资源也相当稀少）和难以防范，所以被认为比XSS更具危险性。


[页面几乎都是Ajax操作，如何更新CSRF Token](http://www.v2ex.com/t/82751)

	可以去看看微博、QQ、其他开源软件怎么做。 据我了解，Discuz、腾讯微博都是没有每次请求更换token的，而是每个登录session初始化一个token。腾讯微博的算法稍微复杂点，从cookie传过来，然会js解密换算后，通过url传递回去的；discuz通过forum filed提交。其实微博貌似都没用csrf token，简单看了下。 


	不用更新, 用页面上那个就可以了. csrf token 只有一种目的: 防止跨站提交. 如果别人能截取到你提交的 token, 那他也能截取每次的返回结果, 已经是超出 csrf 的范围的问题了, 更新了也没用.