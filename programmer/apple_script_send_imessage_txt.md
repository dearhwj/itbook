# 一次未成功的黑客体验——用apple script发送Imessage消息
发布日期：2016年4月17日

之前在[自动化所有超过90秒的工作](http://tech.163.com/15/1125/09/B98MVIIV00094P0U.html)文章里看到了这么一则小故事。

```
某个黑客编写了脚本，脚本自动编理由给老婆发短信说回家要晚。程序会自动从一组字符串里面随机抽取一些理由。
而脚本是放在在 cron-job（即周期性执行，囧）里面运行，只要晚上 9 点之后有他的账号登录公司服务器短信就会自动发送。

```

我也想完成一样的功能。我打算在利用笔记本的利用crontab在周一~周五的20：15（这时如果我的笔记本没关机的话就是在加班）自动从准备好的文件中随机选择一个理由利用mac的imessage发送短信给我老婆。


### 第一步 搞定Imessage的短信发送。
百度了一下Imessage的开发，可以利用Apple Script来发Imessage。AppleScript 是Mac OS X内置的一种功能强大的脚本语言,使用 AppleScript 的目的是把一些重复繁琐并且耗费时间的任务自动化。google到的脚本很简单。
	
	on run {targetBuddyPhone, targetMessage}
    	tell application "Messages"
    	    set targetService to 1st service whose service type = iMessage
        	set targetBuddy to buddy targetBuddyPhone of targetService
	        send targetMessage to targetBuddy
	    end tell
	end run


然后，用```osascript sendMessage.applescript   1395819??? "星期日早上好" ``` 测试通过



### 加班理由的随机选择
准备了一个txt文件每行是一条加班理由

```
cat message.txt
晚上有个会，晚点到家
有故障要处理，晚点到家
事情还没完，你跟涵涵先睡吧

```
用下面的shell脚本搞定加班理由的随机选择

```
while read i;do echo "$i $RANDOM";done<message.txt |sort -k 2n|cut -d" " -f1 | head -n 1
```

看下效果

```
while read i;do echo "$i $RANDOM";done<message.txt |sort -k 2n|cut -d" " -f1 | head -n 1

事情还没完，你跟涵涵先睡吧
```

这个脚本的原理我解释一下

1. $RANDOM 是linux的提供的取随机数
2. ```while read i;do echo "$i $RANDOM";done<message.txt ``` 意思是从message.txt逐行读取，并赋值给i 这个变量。```echo "$i $RANDOM"``` 输出两列第一列是message.txt的一行，第二列是一个随机数，两列直接用一个空格分隔
3. ```sort -k 2n``` 将第二列随机数按数字从小到大排列
4. ```cut -d" " -f1```以空格为分隔符，将第一列加班理由提取出来
5. ```head -n 1``` 只返回第一行


### 最后的聚合命令

```
osascript  sendMessage.applescript  1395819****  "`while read i;do echo "$i $RANDOM";done<message.txt |sort -k 2n|cut  -d" " -f1 | head -n 1`"
```

解释一下while到 head -n 1 被 反引号\` \` 包起来的原因，\`命令\`意思是将反引号中的内容执行一遍，再将结果加入到原命令中重新执行。 

然而没有收到短信...... 是错误了吗？但命令执行没报错误呀

### 折戟成沙还在Imessage的调用
查看了Mac消息应用里面的内容，原来我用脚本触发的短信（蓝色的）都被Imessage拦截了没有发送出去。我用手工输入的发送的同样的内容是可以成功的。看来是mac加入了人机识别，Apple应该是为了防止Imessage的垃圾短信做的这个功能。那么为什么第一次能通过呢，逗我玩吗？

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/imessage_suspened.png)



### 参考资料
1. [How to send an imessage text with applescript](http://stackoverflow.com/questions/11812184/how-to-send-an-imessage-text-with-applescript-only-in-provided-service)
1. [Shell的RANDOM变量](http://blog.sina.com.cn/s/blog_a04184c101010knw.html)
2. [linux shell实现随机数多种方法（date,random,uuid)](http://www.cnblogs.com/chengmo/archive/2010/10/23/1858879.html)
3. [linux bash shell中，单引号、 双引号，反引号（``）的区别及各种括号的区别](http://blog.csdn.net/miyatang/article/details/8077123)



	



	
