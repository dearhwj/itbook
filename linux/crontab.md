# crontab

[Linux/mac crontab 命令格式与详细例子](http://www.tuicool.com/articles/ENRzya)
	
	crontab -e : 执行文字编辑器来设定时程表，内定的文字编辑器是 VI，如果你想用别的文字编辑器，则请先	设定 VISUAL 环境变数

	来指定使用那个文字编辑器(比如说 setenv VISUAL joe)

	crontab -r : 删除目前的时程表

	crontab -l : 列出目前的时程表

	crontab file [-u user]-用指定的文件替代目前的crontab。

[一分钟学会crontab使用](http://lutaf.com/51.htm)
	
	crontab 是在linux服务器上部署定时任务的方法

	0 5 * * * /usr/bin/python /data/www/tools/mysql_backup.py

	cmd之前有5个项目要填，分别对应

	分钟 小时 天 月 一周当中第几天( 0-6 ,0表示星期天)

	填写方法

	* 表示都满足，例如 * * * * * 表示每分钟执行一次，如果每小时执行一次，那应该这样写 
	1 * * * * (每小时第一分钟执行，1可以随便改成60以内的数字)
	/n 表示隔n个单位执行一次
	/3 * * * * 3分钟执行一次
	1 */3 * * * 表示每隔3个小时的第一分钟执行一次
	1 1 */3 * * 表示每隔3天，当天的1点1分执行一次
	1 12 * * 2,3,4,5,6 表示每周二到周6,每天中午12点1分执行
	只需要掌握这2种时间用法，crontab就ok了

	提示：

	crontab 最小粒度是一分钟执行一次，要更快，得用其它办法，比如说写一个daemon程序,用while true: 来做
	crontab -l 查看所有crontab 列表
	cronta -e 编辑crontab
	crontab条目是以文件方式存储的，可以用ls /etc/cron* 查看
