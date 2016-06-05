# nc命令详解


### nc命令检测端口的用法

	# nc  -v  -w 10 %IP%   -z  %PORT%

	-v  显示指令执行过程。

	-w  <超时秒数>   设置等待连线的时间。

	-u  表示使用UDP协议

	-z  使用0输入/输出模式，只在扫描通信端口时使用。

例1：扫描指定的8080端口
	
	# nc -v -w 10 -z 192.168.0.100 8080  
	Connection to 192.168.0.100 8080 port [tcp/http] succeeded!

例2：扫描20到25的端口范围，并详细输出。
	
	# nc -v -w 2 -z 192.168.0.100 20-25   
	nc: connect to 192.168.0.100 port 20 (tcp) failed: Connection refused
	nc: connect to 192.168.0.100 port 21 (tcp) failed: Connection refused
	Connection to 192.168.0.100 22 port [tcp/ssh] succeeded!
	nc: connect to 192.168.0.100 port 23 (tcp) failed: Connection refused
	nc: connect to 192.168.0.100  port 24 (tcp) failed: Connection refused
	nc: connect to 192.168.0.100 port 25 (tcp) failed: Connection refused

例3：扫描1到65535的端口范围，只输出打开的端口（去掉-v参数即可）
	
	# nc -w 1 -z 192.168.0.100 1-65535 


### 批量检测服务器指定端口开放情况
我们可以写这样一个脚本来批量检测端口是否开放：
	
	# vim /scripts/ncports.sh
	#!/bin/bash  
	#检测服务器端口是否开放，成功会返回0值显示ok，失败会返回1值显示fail  
 
	cat /scripts/ip-ports.txt | while read line  
	do  
	  nc -w 10 -z $line > /dev/null 2>&1  
	  if [ $? -eq 0 ]  
	  then  
    	echo $line:ok  
	  else  
    	echo $line:fail  
	  fi   
	done 


### 参考
[Linux下利用nc命令来监控检测服务器的端口使用情况](http://huangrs.blog.51cto.com/2677571/967512)