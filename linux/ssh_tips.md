# SSH Tips

[shell中 diff命令怎么比较远程和本地的文件夹](http://www.iteye.com/problems/69708)

	比较文件可以这样写： 
	ssh host "cat /dir/test.txt" | diff - /dir/test.txt 
	
	比较两个文件夹也是diff dir1 dir2。加上-r是递归。 

	远程目录，先用sshfs把远程目录挂载到本地。然后就像普通的diff一样了。 
	
	远程目录，先用sshfs把远程目录挂载到本地。然后就像普通的diff一样了。 

[批量配置SSH 免密钥登录脚本](http://blog.csdn.net/a3470194/article/details/50523527)




[ssh执行远程服务器需要sudo提权的脚本](http://www.linuxidc.com/Linux/2013-01/78460.htm)

	ssh的-t参数

	 -t      Force pseudo-tty allocation.  This can be used to execute arbitrary screen-based programs on a remote machine, which can be very useful, e.g. when implementing menu services.  Multiple -t options force tty allocation, even if ssh has no local tty.

	中文翻译一下：就是可以提供一个远程服务器的虚拟tty终端，加上这个参数我们就可以在远程服务器的虚拟终端上输入自己的提权密码了，非常安全


	ssh -t -p $port $user@$ip "remote_cmd"
	
	

[远程SSH两级跳转用户sodu的问题--sudo: no tty present and no askpass program specified](http://www.shangxueba.com/jingyan/1600097.html)

	sudo -u mysql mkdir /mysqllog/log/a1.log

[mac 上使用ssh-copy-id 上传公钥 实现不输入密码登录](http://my.oschina.net/u/923974/blog/363757)

	1、准备ssh-copy-id

	brew install ssh-copy-id

	2、生成私钥公钥

	ssh-keygen -t rsa -b 1024

	3、将公钥上传致服务器(~/.ssh/authorized_keys)

	ssh-copy-id -i 公钥 root@192.168.1.xxx

[减少ssh连接连接超时时间（Timeout） ](http://blog.chinaunix.net/uid-24993824-id-3190091.html)

	用以下的方法可以减少ssh连接超时等待的时间：
	方法：ssh -o ConnectTimeout=3 192.168.0.10
	或者修改sshd_config文件里面的UseDNS 选项，改为UseDNS no



[ssh breaks out of while-loop in bash](http://stackoverflow.com/questions/9393038/ssh-breaks-out-of-while-loop-in-bash)

	The problem is that ssh reads from standard input, therefore it eats all your remaining lines. You can just connect its standard input to nowhere:

	ssh $USER@$SERVER "cd ${REMOTE_PATH}; mkdir -p $i" < /dev/null
	You can also use ssh -n instead of the redirection.


[25个必须记住的SSH命令](http://www.cnblogs.com/weafer/archive/2011/06/10/2077852.html)

	从某主机的80端口开启到本地主机2001端口的隧道
	ssh -N -L2001:localhost:80 somemachine


	比较远程和本地文件

	ssh user@host cat /path/to/remotefile | diff /path/to/localfile –
	
	
	通过SSH运行复杂的远程shell命令

	ssh host -l user $(<cmd.txt)
	
	
	

[ssh 免密码登录](http://chenlb.iteye.com/blog/211809)

	
[How to check if dir exist over ssh and return results to host machine](http://stackoverflow.com/questions/15927911/how-to-check-if-dir-exist-over-ssh-and-return-results-to-host-machine)	

	if (ssh username@ssh_server '[ -d /directory ]')
	

[利用 ssh 的用户配置文件 config 管理 ssh 会话](http://dhq.me/use-ssh-config-manage-ssh-session)


	Host    别名
    HostName        主机名
    Port            端口
    User            用户名
    IdentityFile    密钥文件的路径