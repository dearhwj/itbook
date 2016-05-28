# SSH Tips

[25个必须记住的SSH命令](http://www.cnblogs.com/weafer/archive/2011/06/10/2077852.html)

	从某主机的80端口开启到本地主机2001端口的隧道
	ssh -N -L2001:localhost:80 somemachine


	比较远程和本地文件

	ssh user@host cat /path/to/remotefile | diff /path/to/localfile –
	
	
	通过SSH运行复杂的远程shell命令

	ssh host -l user $(<cmd.txt)
	
	
	

[ssh 免密码登录](http://chenlb.iteye.com/blog/211809)

	
	

[利用 ssh 的用户配置文件 config 管理 ssh 会话](http://dhq.me/use-ssh-config-manage-ssh-session)


	Host    别名
    HostName        主机名
    Port            端口
    User            用户名
    IdentityFile    密钥文件的路径