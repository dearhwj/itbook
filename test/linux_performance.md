# Linux性能分析
[http://www.infoq.com/cn/news/2015/12/linux-performance](http://www.infoq.com/cn/news/2015/12/linux-performance)

	uptime
	dmesg | tail
	vmstat 1
	mpstat -P ALL 1
	pidstat 1
	iostat -xz 1
	free -m
	sar -n DEV 1
	sar -n TCP,ETCP 1
	top