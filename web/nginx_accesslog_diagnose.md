# 利用Tengine/Nginx的accesslog做诊断

发布时间：2016年4月12日


Nginx和Tengine会把HTTP访问的日志记录并输出到指定的目录,下面说说利用Tengine和Nginx的accesslog做诊断的一些用法

### 判断请求是否达到WEB服务器
在某些场景下我们需要判断HTTP Request是否到了特定的服务器或者想知道请求到了哪台服务器，accesslog能帮上忙。从accesslog里面grep关键字就能找到线索。有种特殊的情况提醒大家，nginx输出log是等到请求都完成以后的，有种情况是你从accesslog里怎么也找不到请求记录，可能是nginx还没有处理完请求，应该是后端的upstreadm server或者nginx本身慢了

### 判断性能瓶颈
在Nginx的accesslog的输出项在判断性能问题的时候非常有用，$upstream_response_time和$request_time。一下是我们nginx的日志format
	
	 log_format aliyun_com '"$remote_addr" "$remote_user" "[$time_local]" "$request" "$status" "$body_bytes_sent" "$http_referer" "$http_user_agent" "$request_method http://$host$request_uri" "$host" "aliyun.com" "$http_x_forwarded_for" "$request_time" "$remote_port" "$upstream_response_time" "http_x_readtime" "$uri"';

request_time 指的就是从接受用户请求的第一个字节到发送完响应数据的时间，即包括接收请求数据时间、程序响应时间、输出响应数据时间。
upstream_response_time 是指从Nginx向后端建立连接开始到接受完数据然后关闭连接为止的时间。
	
	"10.103.184.39" "-" "[07/Apr/2016:23:59:56 +0800]" "GET /user/accountInfo.htm?cback=aliyun_topbar_account_info&_=1460044791273 HTTP/1.1" "200" "445" "https://whois.aliyun.com/whois/domain/youcaig.com?spm=5334.whyoucaijc.5.1" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 UBrowser/5.6.11466.7 Safari/537.36" "GET http://promotion.aliyun.com/user/accountInfo.htm?cback=aliyun_topbar_account_info&_=1460044791273" "promotion.aliyun.com" "aliyun.com" "125.119.4.234" "0.079" "38757" "0.079" "http_x_readtime" "/user/accountInfo.htm"
	
正常情况下request_time 和 upstream_response_time 会非常接近。当出现request_time比upstream_response_time多很多的情况，那么就要思考一下出现瓶颈的地方了？我遇到过的情况是request_time很大，但upstream_response_time 只有2-3毫秒，原因是tomcat里面有很多的线程被block了，tomcat可用的线程很少，nginx要等很长的时间才能分配到线程。对应的URL请求的upstream_response_time很小说明相应的服务端处理其实是很快的，问题不出现在这块上，是被其他的地方影响了。

### 简单计算QPS

把你需要获取QPS值得时间做为关键字grep accesslog 并统计一下行数。再多找几个时间点平均一下就能获得大概的QPS值

	grep '2016:00:00:01' promotion_web.2016-04-12.log | wc  -l
	grep '2016:00:00:02' promotion_web.2016-04-12.log | wc  -l

	 
	 