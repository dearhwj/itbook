# 应用层拒绝服务攻击
## Slowloris拒绝服务攻击
参考资料[http://www.2cto.com/article/201309/240796.html](http://www.2cto.com/article/201309/240796.html)

而Slowloris攻击则是利用web server的漏洞（或者说是参数配置不合理），直接造成拒绝服务。Slowloris是在2009年由著名Web安全专家RSnake提出的一种攻击方法，其原理是以极低的速度往服务器发送HTTP请求。由于Web Server对于并发的连接数都有一定的上限，因此若是恶意地占用住这些连接不释放，那么Web Server的所有连接都将被恶意连接占用，从而无法接受新的请求，导致拒绝服务。

```
GET / HTTP/1.1\r\n
HOST: host\r\n
User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.503l3; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSOffice 12)\r\n
Content-Length: 42\r\n\r\n
```
最后的两个\r\n表示http请求头结束，如果我们去掉一个\r\n就表示这么包没完成，那么服务器就会等待客户端继续发送这个包的剩余部分，此时客户端再发送任意HTTP头，保持住连接即可。

## billion laughs攻击
参考资料[http://danqingdani.blog.163.com/blog/static/186094195201479103853276/](http://danqingdani.blog.163.com/blog/static/186094195201479103853276/)

攻击原理：构造恶意的XML实体文件耗尽可用内存，因为许多XML解析器在解析XML文档时倾向于将它的整个结构保留在内存中。


## ReDoS
参考资料[http://www.2cto.com/article/201409/332513.html](http://www.2cto.com/article/201409/332513.html)

正则表达式拒绝服务攻击. ReDOS是一种代码缺陷。正则表达式写的不好时，攻击者恶意构造输入时，这些有缺陷的正则表达式就会消耗大量的系统资源（比如CPU和内存），从而导致整台服务器的性能下降，表现的结果是系统速度很慢，有的进程或服务失去响应，与拒绝服务的后果是一样的。ReDOS是一个埋藏在系统中的炸弹。