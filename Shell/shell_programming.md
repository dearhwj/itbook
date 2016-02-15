# Shell Programming


请问如何在shell中获得当前用户名

		name=`whoami`

[shell if else以及大于、小于、等于逻辑表达式](http://lxsym.blog.51cto.com/1364623/866331)
	
	
[shell 判断文件、目录是否存在](http://blog.sina.com.cn/s/blog_9447b14f01016q2y.html)
	
	shell判断文件,目录是否存在或者具有权限 
	 #!/bin/sh 
 
	myPath="/var/log/httpd/" 
	myFile="/var /log/httpd/access.log" 

	 # 这里的-x 参数判断$myPath是否存在并且是否具有可执行权限 
	if [ ! -x "$myPath"]; then 
		mkdir "$myPath" 
	fi 
 
	 # 这里的-d 参数判断$myPath是否存在 
	 if [ ! -d "$myPath"]; then 
	 	mkdir "$myPath" 
	 fi 

	 # 这里的-f参数判断$myFile是否存在 
	 if [ ! -f "$myFile" ]; then 
		 touch "$myFile" 
 	fi 
 
	 # 其他参数还有-n,-n是判断一个变量是否是否有值 
	 if [ ! -n "$myVar" ]; then 
		echo "$myVar is empty" 
	exit 0 
	fi 

	 # 两个变量判断是否相等 
	if [ "$var1" = "$var2" ]; then 
	echo '$var1 eq $var2' 
	else 
	echo '$var1 not eq $var2' 
	fi 

	-f 和-e的区别 
	Conditional Logic on Files 

	-a file exists. 
	-b file exists and is a block special file. 
	-c file exists and is a character special file. 
	-d file exists and is a directory. 
	-e file exists (just the same as -a). 
	-f file exists and is a regular file. 
	-g file exists and has its setgid(2) bit set. 
	-G file exists and has the same group ID as this process. 
	-k file exists and has its sticky bit set. 
	-L file exists and is a symbolic link. 
	-n string length is not zero. 
	-o Named option is set on. 
	-O file exists and is owned by the user ID of this process. 
	-p file exists and is a first in, first out (FIFO) special file or 
	named pipe. 
	-r file exists and is readable by the current process. 
	-s file exists and has a size greater than zero. 
	-S file exists and is a socket. 
	-t file descriptor number fildes is open and associated with a 
	terminal device. 
	-u file exists and has its setuid(2) bit set. 
	-w file exists and is writable by the current process. 
	-x file exists and is executable by the current process. 
	-z string length is zero. 

	是用 -s 还是用 -f 这个区别是很大的！


### shell截取字符串的方法
1. 使用 # 号操作符。用途是从左边开始删除第一次出现子字符串即其左边字符，保留右边字符。用法为#*substr,

	    例如：
	    str='http://www.你的域名.com/cut-string.html'
		echo ${str#*//}
		得到的结果为www.你的域名.com/cut-string.html，即删除从左边开始到第一个"//"及其左边所有字符

2. 使用 ## 号操作符。用途是从左边开始删除最后一次出现子字符串即其左边字符，保留右边字符。用法为##*substr,
    
    	例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${str##*/}
		得到的结果为cut-string.html，即删除最后出现的"/"及其左边所有字符
	
3. 使用 % 号操作符。用途是从右边开始删除第一次出现子字符串即其右边字符，保留左边字符。用法为%substr*,

		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${str%/*}
		得到的结果为http://www.你的域名.com，即删除从右边开始到第一个"/"及其右边所有字符
		
4.  使用 %% 号操作符。用途是从右边开始删除最后一次出现子字符串即其右边字符，保留左边字符。用法为%%substr*,
		
		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${str%%/*}
		得到的结果为http://www.你的域名.com，即删除从右边开始到最后一个"/"及其右边所有字符


5. 从左边第几个字符开始以及字符的个数，用法为:start:len,

		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${var:0:5}
		其中的 0 表示左边第一个字符开始，5 表示字符的总个数。
		结果是：http:
		
6. 从左边第几个字符开始一直到结束，用法为:start,

		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${var:7}
		其中的 7 表示左边第8个字符开始
		结果是：www.你的域名.com/cut-string.html
		
7. 从右边第几个字符开始以及字符的个数，用法:0-start:len,
		
		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${str:0-15:10}
		其中的 0-6 表示右边算起第6个字符开始，10 表示字符的个数。
		结果是：cut-string
		
		
8.从右边第几个字符开始一直到结束，用法:0-start,

		例如：
		str='http://www.你的域名.com/cut-string.html'
		echo ${str:0-4}
		其中的 0-6 表示右边算起第6个字符开始，10 表示字符的个数。
		结果是：html
		注：（左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示）



[Linux bash shell 逐行读取文件的三种方法](http://blog.chinaunix.net/uid-20551209-id-3761912.html)

#### 方法一，指定换行符读取：

	\#! /bin/bash  
  
	IFS="  "   
	for LINE in `cat /etc/passwd`  
	do   
        echo $LINE 
	done
	
	
#### 方法二，文件重定向给read处理：

	\#! /bin/bash  
  
	cat /etc/passwd | while read LINE  
	do
        echo $LINE 

	done
 

#### 方法三，用read读取文件重定向：

	\#! /bin/bash    
	while read LINE
	do
        echo $LINE 
	done < /etc/passwd

访问二和三比较相似，推荐用方法三


[用shell将时间字符串与时间戳互转](http://blog.csdn.net/runming918/article/details/7384828)

	用shell将时间字符串与时间戳互转：
      date -d "2010-10-18 00:00:00" +%s         输出形如：1287331200
	而时间戳转换为字符串可以这样做：
      date -d @1287331200  "+%Y-%m-%d"    输出形如：2010-10-18
	如果需要得到指定日期的前后几天，可以：
      1、seconds=`date -d "2010-10-18 00:00:00" +%s`       #得到时间戳
      2、seconds_new=`expr $seconds + 86400`                   #加上一天的秒数86400
      3、date_new=`date -d @$seconds_new "+%Y-%m-%d"`   #获得指定日前加上一天的日前

