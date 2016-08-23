# Git小窍门
[error: src refspec master does not match any](http://www.crifan.com/git_push_error_src_refspec_master_does_not_match_any/)

	得知是由于当前项目下没有文件供上传，项目为空所导致的。


[Git回滚的常用手法](http://hittyt.iteye.com/blog/1961386)


[ git rebase简介(基本篇)](http://blog.csdn.net/hudashi/article/details/7664631/)
	
	在rebase的过程中，也许会出现冲突(conflict). 在这种情况，Git会停止rebase并会让你去解决 冲突；在解决完冲突后，用"git-add"命令去更新这些内容的索引(index), 然后，你无需执行 git-commit,只要执行:
	$ git rebase --continue
	这样git会继续应用(apply)余下的补丁。
	在任何时候，你可以用--abort参数来终止rebase的行动，并且"mywork" 分支会回到rebase开始前的状态。
	$ git rebase --abort

[ Git fetch和git pull的区别](http://blog.csdn.net/hudashi/article/details/7664457)

	在实际使用中，git fetch更安全一些 因为在merge前，我们可以查看更新情况，然后再决定是否合并
	另外，fetch可以获取远端的分支信息

[ git中手动删除的文件如何在git中删除](http://blog.csdn.net/xiaoyuanzhiying/article/details/44085135)

	第一种就是用 git rm files 删除你手动删除的文件或文件夹。
	git add -A . 或者 使用 git add --all . 这里 -A 是 --all 的一个简写。

[Git 的 .gitignore 配置](http://www.cnblogs.com/haiq/archive/2012/12/26/2833746.html)

	
	.gitignore 配置文件用于配置不需要加入版本管理的文件，配置好该文件可以为我们的版本管理带来很大的便利，以下是个人对于配置 .gitignore 的一些心得。

	1、配置语法：
	以斜杠“/”开头表示目录；
	以星号“*”通配多个字符；
	以问号“?”通配单个字符
	以方括号“[]”包含单个字符的匹配列表；
	以叹号“!”表示不忽略(跟踪)匹配到的文件或目录；
	此外，git 对于 .ignore 配置文件是按行从上到下进行规则匹配的，意味着如果前面的规则匹配的范围更大，则后面的规则将不会生效；

	2、示例：
	（1）规则：fd1/*
	说明：忽略目录 fd1 下的全部内容；注意，不管是根目录下的 /fd1/ 目录，还是某个子目录 /child/fd1/ 目录，都会被忽略；
	（2）规则：/fd1/*
	说明：忽略根目录下的 /fd1/ 目录的全部内容；
	（3）规则：
		/*
		!.gitignore
		!/fw/bin/
		!/fw/sf/

	说明：忽略全部内容，但是不忽略 .gitignore 文件、根目录下的 /fw/bin/ 和 /fw/sf/ 目录；




[git获取远程分支到本地新分支中](http://yuxu9710108.blog.163.com/blog/static/23751534201111644755138/)

	   通过git clone获取的远端git库，只包含了远端git库的当前工作分支。如果想获取其它分支信息，需要使用 “git branch –r” 来查看， 如果需要将远程的其它分支代码也获取过来，可以使用命令 “ git checkout -b 本地分支名 远程分支名”，其中，远程分支名为 “git branch –r” 所列出的分支名， 一般是诸如“origin/分支名”的样子。如果本地分支名已经存在， 则不需要“-b”参数。

[Git紧急处理问题，需要切分支](http://www.cnblogs.com/wangkongming/p/5291513.html)