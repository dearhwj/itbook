# Git Tips



[git 撤销未提交的修改]("http://blog.csdn.net/xbl1986/article/details/8515953")
	git checkout
	恢复某个已修改的文件（撤销未提交的修改）：
	$ git checkout file-name

	例如：git checkout src/com/android/.../xxx.java

	比如修改的都是java文件，不必一个个撤销，可以使用

	$ git checkout *.java

	撤销所有修改
	$ git checkout .