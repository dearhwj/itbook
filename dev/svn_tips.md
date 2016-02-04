# Svn Tips
[svn log 查询我刚刚提交修改的内容]("http://www.blogdaren.com/post-1556.html")

	$ svn log -r 8 -v


[svn 提交时 文件夹 missing 问题的解决]("http://www.cppblog.com/elprup/archive/2010/11/07/132837.html")

	>svn ci
	svn: 提交失败(细节见下)：
	svn: Directory '/home/usr/svncheckout/tag' is missing

	引用http://stackoverflow.com/questions/1032031/how-to-get-rid-of-missing-directories-in-svn-commit
	>mkdir tag
	>svn delete --force ./tag
	D tag
	解决。

[svn resolved]("http://wangqiaowqo.iteye.com/blog/1396306")

	1、解决冲突后使用 
	svn resolved config.inc.php 
	2、svn status 
	发现config.inc.php 已变成M 
	3、将本地提交 
		svn ci config.inc.php -m 'online config'