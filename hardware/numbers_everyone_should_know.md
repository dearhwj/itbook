# 这几个数字每个程序员都应该知道
这几个数字硬件操作的耗时，单位是纳秒，随着硬件的发展这些数字应该会越来越小。但几种不同的调用间的比例关系应该不会太大的变动。基于这些数据，大家就能评估出来，一些操作的性能差异，例如当mysql临时排序的时候，当需要排序的内容没有超过一个阈值的时候会把数据放到内存，超过以后会放到本地磁盘，这两者的性能差异就能根据disk和内存操作的差异计算出来性能的高低。

	1秒=1000毫秒
	1毫秒=1000微秒
	1微秒=1000纳秒
	1纳秒=1000皮秒
	1皮秒=1000飞秒

	L1 cache reference                             0.5 ns
	Branch mispredict                              5 ns
	L2 cache reference                             7 ns
	Mutex lock/unlock                            100 ns (25)
	Main memory reference                        100 ns
	Compress 1K bytes with Zippy              10,000 ns (3,000)
	Send 2K bytes over 1 Gbps network         20,000 ns
	Read 1 MB sequentially from memory       250,000 ns
	Round trip within same datacenter        500,000 ns
	Disk seek                             10,000,000 ns
	Read 1 MB sequentially from network   10,000,000 ns
	Read 1 MB sequentially from disk      30,000,000 ns (20,000,000)
	Send packet CA->Netherlands->CA      150,000,000 ns