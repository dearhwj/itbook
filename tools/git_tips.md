# Git小窍门
[git获取远程分支到本地新分支中](http://yuxu9710108.blog.163.com/blog/static/23751534201111644755138/)

	   通过git clone获取的远端git库，只包含了远端git库的当前工作分支。如果想获取其它分支信息，需要使用 “git branch –r” 来查看， 如果需要将远程的其它分支代码也获取过来，可以使用命令 “ git checkout -b 本地分支名 远程分支名”，其中，远程分支名为 “git branch –r” 所列出的分支名， 一般是诸如“origin/分支名”的样子。如果本地分支名已经存在， 则不需要“-b”参数。

[Git紧急处理问题，需要切分支](http://www.cnblogs.com/wangkongming/p/5291513.html)