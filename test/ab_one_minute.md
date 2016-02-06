# 一分钟学会Apache Benchmark

ab的全称是ApacheBench，是 Apache 附带的一个小工具，专门用于 HTTP Server 的benchmark testing，可以同时模拟多个并发请求
[文档地址]("https://httpd.apache.org/docs/2.2/programs/ab.html")

### 安装
如果使用的是mac，mac默认都装了:-)，Windows的自己去找找吧。

### 使用
#### 基础
ab一般常用参数就是 -n， -t ，和 -c。

	-c（concurrency）表示用多少并发来进行测试；
	-t表示测试持续多长时间；
	-n表示要发送多少次测试请求。
	一般-t或者-n选一个用。


ab  -n 100 -c 2 https://www.aliyun.com/

			Connection Times 
				(ms) 	min  mean[+/-sd] median   max
	Connect:       46   81  15.8     80     122
	Processing:    65   85  12.3     84     108
	Waiting:       14   17   1.6     17      19
	Total:        143  166  18.8    167     204

	Percentage of the requests served within a certain time (ms)
	  50%    167
	  66%    172
	  75%    175
	  80%    189
	  90%    203
	  95%    204
	  98%    204
	  99%    204
	 100%    204 (longest request)
	 

#### 对需要登录的URL进行压力测试

多数网站是通过cookie记录登录信息的，我们就可以利用这个实现对登录URL的压力测试。以aliyun.com为例!

[image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/login-ticket.png)

把这个cookie的值提出来。组成下面这个命令行。 -C 用来指定cookie的key和value，-H用来指定HTTP的Head信息，因为我们调用的html是是一个jsonp接口，服务端对refer进行了限制。-v 这个参数可以显示返回的明细信息，我们通过这个参数可以看到服务器返回的实际的内容

 ab  -v 3  -n  20 -c 2 -H  'referer:https://www.aliyun.com/' -C  'login_aliyunid_ticket=3_1$$w0Kpe0QRb9HAvoZo9V6an0wVT_HlGIKU7t1E5ePiMUZf_YNpoU_BOTwChTBoNM1ZJeedfK9zxYnbN5hossqIZCr6t7SGxRigm2Cb4fGaCdBZWIzmgdHq6sXXZQg4KFWufyvpeV*0*Cm58slMTJt0' https://promotion.aliyun.com/user/accountInfo.htm\?cback\=aliyunTopbarAccountInfo\&_\=1454220335484
通过屏幕的输出能看到
	
	jsonp的返回信息
	aliyunTopbarAccountInfo({"code":200,"data":{"certified":true,"couponMoney":2,"instanceCount":{"ecsExpiredCount":0,"ecsUnExpiredCount":0,"ecsUnExpiredCountBy1d":0,"ecsUnExpiredCountBy7d":0,"rdsExpiredCount":0,"rdsUnExpiredCountBy1d":0,"rdsUnExpiredCountBy7d":0},"messageCount":37,"prepayMoney":0.00,"unpaidOrderCount":0,"userLevel":{"equityNum":2,"isProdRetain":"1","level":"L1","showUpgradeNotice":false}},"msg":""});
	
	也有压力测试的结果数据
	Connection Times (ms)
              min  mean[+/-sd] median   max
	Connect:       40   68  18.9     69     102
	Processing:    45   70  37.0     54     160
	Waiting:       44   70  36.7     54     160
	Total:         86  138  45.8    124     243

	Percentage of the requests served within a certain time (ms)
  	50%    124
  	66%    153
  	75%    157
  	80%    176
  	90%    209
  	95%    243
  	98%    243
  	99%    243
 	100%    243 (longest request)

