# 程序员如何优雅地使用Mac

### JAVA篇

[在MAC上查找和设置$JAVA_HOME](http://guibin.iteye.com/blog/1999238)
	
	可以使用工具命令“/usr/libexec/java_home”来定位JAVA_HOME，这下爽了：
	
	$ cat ~/.profile  
  
	JAVA_HOME=`/usr/libexec/java_home`  
	export JAVA_HOME  
  
	$ echo $JAVA_HOME  
	/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home  



[Mac安装maven](http://blog.csdn.net/hwwzyh/article/details/45567419)

	MAVEN_HOME=Documents/maven/apache-maven-3.3.3
     PATH=$MAVEN_HOME/bin:$PATH
     export MAVEN_HOME
     export PATH
     export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home\


### 工具篇     
     
[vim的配置指令](http://blog.csdn.net/yangtalent1206/article/details/21449267)     
     
[解决ssh的"Write failed: Broken pipe"问题](http://www.cnblogs.com/dudu/archive/2013/02/07/ssh-write-failed-broken-pipe.html)

	 ~/.ssh/ 文件夹中添加 config 文件
	 ServerAliveInterval 60
	 ClientAliveInterval 60

[如何向git账号上提交代码](http://www.cnblogs.com/wangkongming/p/4158664.html)


[Tmux 速成教程：技巧和调整](http://blog.jobbole.com/87584/)

	brew install tmux


### 其他

[程序员如何优雅地使用 Mac？](http://www.zhihu.com/question/20873070)

[高效MacBook工作环境配置](http://blog.csdn.net/qjbagu/article/details/47261123)

	窗口管理软件 - SizeUp
	Manico
	
[Shortcat：键盘快捷键新玩儿法](http://www.waerfa.com/shortcat)

	Shortcat 是一款键盘辅助工具，可以通过快捷键到达屏幕上的任何文字而不需要移动鼠标
	
	
	shortcat的激活方式：系统偏好设置->安全性与隐私->辅助功能