# Nginx/Tengine错误码
Nginx/Tengine 的accesslog中会记录HTTP STATUS CODE。一些标准的HTTP STATUS CODE，例如502、503、504......这些大家应该都比较熟悉了。除此以外，Nginx/Tengine还有它自定义的STATUS CODE，这些CODE对于排查线上的故障非常有帮助

### STATUS CODE 499
先看一下Nginx源代码中对499的解释。

	/*
	  * HTTP does not define the code for the case when a client closed
	  * the connection while we are processing its request so we introduce
	  * own code to log such situation when a client has closed the connection
	 * before we even try to send the HTTP header to it
	  */
	#define NGX_HTTP_CLIENT_CLOSED_REQUEST     499
	
这段注释的意思是当Nginx把HTTP的Header 发送给客户端的时候，这个客户端发现已经关闭了，所以输出了到日志并记录CODE 499.

出现499的原因也会比较多，跟应用相关的最大几率是服务端（JETTY/TOMCAT/PHP）等响应慢，客户的浏览器等不及Nginx的响应，直接关闭了浏览器，等到Nginx从服务器获取到了响应要输出给浏览器的时候发现客户端已经关闭，因此输出了499。服务端（JETTY/TOMCAT/PHP）等响应慢的原因会比较多，比如URL对应的服务端性能比较差，也有可能是服务端的连接池耗尽。

还有其他一些原因，大家可以自己百度，[Nginx 499错误的原因及解决方法](http://wmcxy.iteye.com/blog/2026835?&from=androidqq)这篇文章解释的是另外一种原因。


### 其他Nginx/Tengine自定义的HTTP STATUS CODE
下载NGINX的源代码,grep 499

	 find .  -type f | xargs grep 499
	 
	./http/ngx_http_core_module.c:        if (err->status == NGX_ERROR || err->status == 499) {
	./http/ngx_http_request.h:#define NGX_HTTP_CLIENT_CLOSED_REQUEST     499
	./http/ngx_http_special_response.c:    ngx_null_string,                     /* 499, client has closed connection */ 
	
	
能看的出来，NGINX的HTTP STATUS CODE 都定义在ngx_http_request.h 这个文件里, 这几个错误码都没遇到过就不解释了，大家自己看注释吧


	/* Our own HTTP codes */

	/* The special code to close connection without any response */
	#define NGX_HTTP_CLOSE                     444

	#define NGX_HTTP_NGINX_CODES               494

	#define NGX_HTTP_REQUEST_HEADER_TOO_LARGE  494

	#define NGX_HTTPS_CERT_ERROR               495
	#define NGX_HTTPS_NO_CERT                  496

	/*
	 * We use the special code for the plain HTTP requests that are sent to
	 * HTTPS port to distinguish it from 4XX in an error page redirection
	 */
	#define NGX_HTTP_TO_HTTPS                  497

	/* 498 is the canceled code for the requests with invalid host name */

	/*
	 * HTTP does not define the code for the case when a client closed
	 * the connection while we are processing its request so we introduce
	 * own code to log such situation when a client has closed the connection
	 * before we even try to send the HTTP header to it
	 */
	#define NGX_HTTP_CLIENT_CLOSED_REQUEST     499

