# Linux/Mac批量删除文件
原文地址:[http://blog.csdn.net/hzhsan/article/details/17200873](http://blog.csdn.net/hzhsan/article/details/17200873)	
	#find ... -exec rm {} \; 
	#find ... | xargs rm -rf 

两者都可以把find命令查找到的结果删除，其区别简单的说是前者是把find发现的结果一次性传给exec选项，这样当文件数量较多的时候，就可能会出现“参数太多”之类的错误，相比较而言，后者就可以避免这个错误，因为xargs命令会分批次的处理结果。这样看来，“find ... | xargs rm -rf”是更通用的方法，推荐使用！

rm不接受标准输入，所以不能用find / -name "tmpfile" ｜rm

-exec   必须由一个   ;   结束，而因为通常   shell   都会对   ;   进行处理，所以用   \;   防止这种情况。   
{}   可能需要写做   '{}'，也是为了避免被   shell   过滤
