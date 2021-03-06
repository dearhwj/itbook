# 管理Ubuntu开机启动项

原文地址[http://blog.sina.com.cn/s/blog_6df127760101klc7.html](http://blog.sina.com.cn/s/blog_6df127760101klc7.html)

### 背景知识
　
####　Ubuntu运行级别  

　　Linux系统任何时候都运行在一个指定的运行级上，并且不同的运行级的程序和服务都不同，所要完成的工作和要达到的目的都不同，系统可以在这些运行级之间进行切换，以完成不同的工作。  

Ubuntu 的系统运行级别： 

* 0:系统停机状态  
* 1:单用户或系统维护状态  
* 2~5: 多用户状态  
* 6:重新启动 

查看当前运行级别,执行命令：  

```
runlevel  
```
　
切换运行级别，执行命令： 

```  
int [0123456Ss]  
　　（ 即在 init
命令后跟一个参数，此参数是要切换到的运行级的运行级代号，如：用 init 0 命令关机；用 init 6
命令重新启动。）

```

#### Linux 系统主要启动步骤:  

　　 

1. 读取MBR 的信息,启动 Boot Manager  

2. 加载系统内核,启动 init 进程 。init 进程是Linux 的根进程,所有的系统进程都是它的子进程。  
3. init进程读取 /etc/inittab 文件中的信息,并进入预设的运行级别,  按顺序运行该运行级别对应文件夹下的脚本。脚本通常以start 参数启动,并指向一个系统中的程序。 通常情况下,/etc/rcS.d/ 目录下的启动脚本首先被执行,然后是  /etc/rcN.d/
目录。例如您设定的运行级别为 3,那么它对应的启动目录为/etc/rc3.d/ 。 
4. 根据/etc/rcS.d/ 文件夹中对应的脚本启动 Xwindow 服务器 xorg  Xwindow 为Linux 下的图形用户界面系统。  
5. 启动登录管理器,等待用户登录 。Ubuntu系统默认使用 GDM 作为登录管理器,您在登录管理器界面中 。输入用户名和密码后,便可以登录系统。(您可以在 /etc/rc3.d/ 文件夹中找到一个名为S13gdm 的链接)

### 安装sysv-rc-conf

```
sudo apt-get install sysv-rc-conf  

```
### 使用sysv-rc-conf

```
sudo sysv-rc-conf  
```
　　操作界面十分简洁，你可以用鼠标点击，也可以用键盘方向键定位，用空格键选择，“X”表示开启该服务。用Ctrl+N翻下一页，用Ctrl+P翻上一页，用Q退出。