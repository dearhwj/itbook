# shell实现随机数多种方法
### 通过时间获得随机数（date)

	date +%s
	1287764773
	#如果用它做随机数，相同一秒的数据是一样的。在做循环处理，多线程里面基本不能满足要求了。

	function random()
	{
    	min=$1;
	    max=$2-$1;
    	num=$(date +%s+%N);
	    ((retnum=num%max+min));
	    #进行求余数运算即可
    	echo $retnum;
	    #这里通过echo 打印出来值，然后获得函数的，stdout就可以获得值
    	#还有一种返回，定义全价变量，然后函数改下内容，外面读取
	}

### 通过内部系统变量($RANDOM)
linux已经提供有个系统环境变量了，直接就是随机数，哈哈，觉得刚学习方法，是不是白费了！！

	[chengmo@centos5  shell]$ echo $RANDOM
	10918
	[chengmo@centos5  shell]$ echo $RANDOM
	10001
 
	连续2次访问，结果不一样，这个数据是一个小于或等于5位的整数可能有疑问了，如果超过5位的随机数怎么得到呢？呵呵，加个固定10位整数，然后进行求余，跟例1 一样了。接下来的例子又是我们自立更生做了。
	

### 通过系统内部唯一数据生成随机数（/dev/random,urandom)
我们知道dev目录下面，是linux一些默认设备，它给我们感觉就是放的是键盘，硬盘，光驱等设备的对应文件了。 其实linux有些设备很特殊，有特殊用途。前面我们说到的：/dev/[udp|tcp]/host/port比较特殊吧。呵呵，有扯远了。

/dev/random设备，存储着系统当前运行的环境的实时数据。它可以看作是系统某个时候，唯一值数据，因此可以用作随机数元数据。我们可以通过文件读取方式，读得里面数据。/dev/urandom这个设备数据与random里面一样。只是，它是非阻塞的随机数发生器，读取操作不会产生阻塞。

实例：

	[chengmo@centos5  shell]$ head -1 /dev/urandom
	ãÅ†ù…•KTþçanVÕã¹Û&¡õ¾“ô2íùU“ žF¦_ ÿ”†mEðûUráÏ=J¯TŸA•ÌAÚRtÓ
 
读一行，怎么是乱码呢？其实它是通过二进制数据保存实时数据的，那么我们怎么样把它变成整型数据呢？
 
 
	[chengmo@centos5 ~/shell]$ head -200 /dev/urandom | cksum
	1615228479 50333

由于urandom的数据是非常多，不能直接通过cat读取，这里取前200行，其实整个数据都是变化的，取多少也一样是唯一的。cksum 将读取文件内容，生成唯一的表示整型数据，只有文件内容不变，生成结果就不会变化,与php crc函数
 
	[chengmo@centos5  shell]$ head -200 /dev/urandom | cksum | cut -f1 -d" "
	
	484750180
	#cut 以” “分割，然后得到分割的第一个字段数据	
	
### 读取linux 的uuid码

linux的uuid码也是有内核提供的，在/proc/sys/kernel/random/uuid这个文件内。

	[chengmo@centos5 ~/shell]$ cat /proc/sys/kernel/random/uuid
	dff68213-b700-4947-87b1-d9e640334196
	[chengmo@centos5 ~/shell]$ cat /proc/sys/kernel/random/uuid
	7b57209a-d285-4fd0-88b4-9d3162d2e1bc	

### Awk传递变量
	awk 'BEGIN{srand();print rand()}'
	
	
### 参考资料
[linux shell实现随机数多种方法（date,random,uuid)](http://www.cnblogs.com/chengmo/archive/2010/10/23/1858879.html)
[Shell的RANDOM变量](http://blog.sina.com.cn/s/blog_a04184c101010knw.html)	