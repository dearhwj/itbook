# Git Tips

### Tips

[git使用命令, 特别:git checkout -b a 与 git branch a区别](http://my.oschina.net/u/587974/blog/74341)


[GIT分支管理是一门艺术](http://roclinux.cn/?p=2129)

[Git 分支管理和冲突解决](http://www.cnblogs.com/mengdd/p/3585038.html)

[Git Stash用法](http://www.cppblog.com/deercoder/archive/2011/11/13/160007.aspx)

	使用git的时候，我们往往使用branch解决任务切换问题，例如，我们往往会建一个自己的分支去修改和调试代码, 如果别人或者自己发现原有的分支上有个不得不修改的bug，我们往往会把完成一半的代码 commit提交到本地仓库，然后切换分支去修改bug，改好之后再切换回来。这样的话往往log上会有大量不必要的记录。其实如果我们不想提交完成一半或者不完善的代码，但是却不得不去修改一个紧急Bug，那么使用'git stash'就可以将你当前未提交到本地（和服务器）的代码推入到Git的栈中，这时候你的工作区间和上一次提交的内容是完全一样的，所以你可以放心的修 Bug，等到修完Bug，提交到服务器上后，再使用'git stash apply'将以前一半的工作应用回来。也许有的人会说，那我可不可以多次将未提交的代码压入到栈中？答案是可以的。当你多次使用'git stash'命令后，你的栈里将充满了未提交的代码，这时候你会对将哪个版本应用回来有些困惑，'git stash list'命令可以将当前的Git栈信息打印出来，你只需要将找到对应的版本号，例如使用'git stash apply stash@{1}'就可以将你指定版本号为stash@{1}的工作取出来，当你将所有的栈都应用回来的时候，可以使用'git stash clear'来将栈清空。
	在这里顺便提下git format-patch -n , n是具体某个数字， 例如 'git format-patch -1' 这时便会根据log生成一个对应的补丁，如果 'git format-patch -2' 那么便会生成2个补丁，当然前提是你的log上有至少有两个记录。


[Git冲突：commit your changes or stash them before you can merge.](http://blog.csdn.net/lincyang/article/details/21519333)

	1.stash
	通常遇到这个问题，你可以直接commit你的修改；但我这次不想这样。
	看看git stash是如何做的。
	git stash
	git pull
	git stash pop
	接下来diff一下此文件看看自动合并的情况，并作出相应修改。
	git stash: 备份当前的工作区的内容，从最近的一次提交中读取相关内容，让工作区保证和上次提交的内容一	致。同时，将当前的工作区内容保存到Git栈中。
	git stash pop: 从Git栈中读取最近一次保存的内容，恢复工作区的相关内容。由于可能存在多个Stash的内容，所以用栈来管理，pop会从最近的一个stash中读取内容并恢复。
	git stash list: 显示Git栈内的所有备份，可以利用这个列表来决定从那个地方恢复。
	git stash clear: 清空Git栈。此时使用gitg等图形化工具会发现，原来stash的哪些节点都消失了。

	2.放弃本地修改，直接覆盖之
	git reset --hard
	git pull



[git 把远程分支拿到本地，并建立关联关系track](http://blog.csdn.net/arkblue/article/details/9790129)
	
	从远程分支 checkout 出来的本地分支，称为_跟踪分支(tracking branch)_。跟踪分支是一种和远程分支有直接联系的本地分支。在跟踪分支里输入git push，Git 会自行推断应该向哪个服务器的哪个分支推送数据。反过来，在这些分支里运行git pull 会获取所有远程索引，并把它们的数据都合并到本地分支中来。
	在克隆仓库时，Git 通常会自动创建一个名为 master 的分支来跟踪 origin/master。这正是git push 和 git pull 一开始就能正常工作的原因。当然，你可以随心所欲地设定为其它跟踪分支，比如origin 上除了 master 之外的其它分支。刚才我们已经看到了这样的一个例子：git checkout -b [分支名] [远程名]/[分支名]。

[如何配置Git支持大小写敏感和修改文件名中大小写字母呢](http://www.tuicool.com/articles/AnimaaE)

	$ git config core.ignorecase false

[git 撤销未提交的修改](http://blog.csdn.net/xbl1986/article/details/8515953)

	git checkout
	恢复某个已修改的文件（撤销未提交的修改）：
	$ git checkout file-name

	例如：git checkout src/com/android/.../xxx.java

	比如修改的都是java文件，不必一个个撤销，可以使用

	$ git checkout *.java

	撤销所有修改
	$ git checkout .
	
[git克隆远程项目并创建本地对应分支](http://jingyan.baidu.com/article/19192ad83ea879e53e5707ce.html)

### 扩展
[如何在Git Hooks中运行Grunt任务](http://www.jianshu.com/p/d9d6c90bbc9c)
	
### 参考

[Git Reference ](http://git-scm.com/docs)

[GitCommunityBook 中文版	](http://gitbook.liuhui998.com/)
