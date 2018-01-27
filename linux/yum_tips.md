# 用yum管理软件
[用yum查询想安装的软件](http://blog.csdn.net/phpfengzikai/article/details/7085592)

	1.使用YUM查找软件包
	 命令：yum search~
	 2.列出所有可安装的软件包
	 命令：yum list
	 3.列出所有可更新的软件包
	 命令：yum list updates
	 4.列出所有已安装的软件包
	 命令：yum list installed
	 5.列出所有已安装但不在Yum Repository 內的软件包
	 命令：yum list extras
	 6.列出所指定软件包
	 命令：yum list ～
	 7.使用YUM获取软件包信息
	 命令：yum info ～
	 8.列出所有软件包的信息
	 命令：yum info
	 9.列出所有可更新的软件包信息
	 命令：yum info updates
	 10.列出所有已安裝的软件包信息
	 命令：yum info installed
	 11.列出所有已安裝但不在Yum Repository 內的软件包信息
	 命令：yum info extras
	 12.列出软件包提供哪些文件
	 命令：yum provides~
	 
	 
[在Centos中yum安装和卸载软件的使用方法](http://blog.51cto.com/gzmaster/72278)

	安装一个软件时
	yum -y install httpd
	安装多个相类似的软件时
	yum -y install httpd*
	安装多个非类似软件时
	yum -y install httpd php php-gd mysql
	卸载一个软件时
	yum -y remove httpd
	卸载多个相类似的软件时
	yum -y remove httpd*
	卸载多个非类似软件时
	yum -y remove httpd php php-gd mysql	 
	
[CentOS 7更改yum源与更新系统](https://www.cnblogs.com/taomylife/p/7851744.html)
	