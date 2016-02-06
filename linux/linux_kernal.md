# Linux Kernal

[slabtop简单的用途](http://blog.yufeng.info/archives/1960)

	我们知道内核的模块在分配资源的时候，为了提高效率和资源的利用率，都是透过slab来分配的。我们通过slab的信息，再配合源码能粗粗了解系统的运行情况，比如说什么资源有没有不正常的多，或者什么资源有没有泄漏。
	linux系统透过/proc/slabinfo来向用户暴露slab的使用情况的,我们来看下：
	$ head /proc/slabinfo
