# 用rpm管理软件
[redhat/centos系统下将rpm包安装到指定目录](http://jingyan.baidu.com/article/6181c3e06c0205152ef153fe.html)

	比如安装xxx.rpm包，以relocate 参数进行安装，安装到/opt/temp目录：
	rpm -ivh --relocate /=/opt/temp xxx.rpm；
	以prefix进行安装：
	rpm -ivh --prefix= /opt/temp  xxx.rpm
	
[如何卸载rpm包](http://www.cnblogs.com/ziziwu/archive/2012/02/01/2335102.html)
	
	首先通过  rpm -q <关键字> 可以查询到rpm包的名字

 	然后 调用 rpm -e <包的名字> 删除特定rpm包

 	如果遇到依赖，无法删除，使用 rpm -e --nodeps <包的名字> 不检查依赖，直接删除rpm包

 	如果恰好有多个包叫同样的名字，使用 rpm -e --allmatches --nodeps <包的名字> 删除所有相同名字的包， 并忽略依赖	
