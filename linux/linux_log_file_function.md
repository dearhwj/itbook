# /var/log目录下的20个Linux日志文件功能详解


发布日期：2016年4月1日

***我觉得找日志、看日志的能力很大程度上决定了程序员分析应用异常原因的能力。***当我们的系统出现问题的时候，最重要的就是找到相应的日志，然后确定或者排除问题原因。应用自身的日志大家都很熟悉，对使用的中间件(Hsf，Diamond)的日志也有相应的规范大家也应该知道。下面介绍的是一些操作系统层面的日志，在排查某些问题的时候“一剑封喉”非常好用。

以下介绍的是20个位于/var/log/ 目录之下的日志文件。其中一些只有特定版本采用，如dpkg.log只能在基于Debian的系统中看到。

1. /var/log/messages — 包括整体系统信息，其中也包含系统启动期间的日志。此外，mail，cron，daemon，kern和auth等内容也记录在var/log/messages日志中。 ***这个文件大家一定要记住，系统的一些异常信息最有可能出现在这个文件里面，有一次生产环境java进程被系统kill掉了，我和木纹就在这个文件里面发现了线索，java开了太多的线程导致系统内存耗尽，系统kill了java进程，并在这个日志文件里面输出了kill进程的原因，后面的其他几个文件用的较少，在出现相应场景的问题以后到对应的文件翻看日志***
2. /var/log/dmesg — 包含内核缓冲信息（kernel ring buffer）。在系统启动时，会在屏幕上显示许多与硬件有关的信息。可以用dmesg查看它们。
3. /var/log/auth.log — 包含系统授权信息，包括用户登录和使用的权限机制等。
4. /var/log/boot.log — 包含系统启动时的日志。
5. /var/log/daemon.log — 包含各种系统后台守护进程日志信息。
6. /var/log/dpkg.log – 包括安装或dpkg命令清除软件包的日志。
7. /var/log/kern.log – 包含内核产生的日志，有助于在定制内核时解决问题。
8. /var/log/lastlog — 记录所有用户的最近信息。这不是一个ASCII文件，因此需要用lastlog命令查看内容。
9. /va /log/maillog /var/log/mail.log — 包含来着系统运行电子邮件服务器的日志信息。例如，sendmail日志信息就全部送到这个文件中。
10. /var/log/user.log — 记录所有等级用户信息的日志。
11. /var/log/Xorg.x.log — 来自X的日志信息。
12. /var/log/alternatives.log – 更新替代信息都记录在这个文件中。
13. /var/log/btmp – 记录所有失败登录信息。使用last命令可以查看btmp文件。例如，”last -f /var/log/btmp | more“。
14. /var/log/cups — 涉及所有打印信息的日志。
15. /var/log/anaconda.log — 在安装Linux时，所有安装信息都储存在这个文件中。
16. /var/log/yum.log — 包含使用yum安装的软件包信息。
17. /var/log/cron — 每当cron进程开始一个工作时，就会将相关信息记录在这个文件中。
18. /var/log/secure — 包含验证和授权方面信息。例如，sshd会将所有信息记录（其中包括失败登录）在这里。
19. /var/log/wtmp或/var/log/utmp — 包含登录信息。使用wtmp可以找出谁正在登陆进入系统，谁使用命令显示这个文件或信息等。
20 /var/log/faillog – 包含用户登录失败信息。此外，错误登录命令也会记录在本文件中。



除了上述Log文件以外， /var/log还基于系统的具体应用包含以下一些子目录：

1. /var/log/httpd/或/var/log/apache2 — 包含服务器access_log和error_log信息。
2. /var/log/lighttpd/ — 包含light HTTPD的access_log和error_log。
3. /var/log/mail/ – 这个子目录包含邮件服务器的额外日志。
4. /var/log/prelink/ — 包含.so文件被prelink修改的信息。
5. /var/log/audit/ — 包含被 Linux audit daemon储存的信息。
6. /var/log/samba/ – 包含由samba存储的信息。
7. /var/log/sa/ — 包含每日由sysstat软件包收集的sar文件。
8. /var/log/sssd/ – 用于守护进程安全服务。
除了手动存档和清除这些日志文件以外，还可以使用logrotate在文件达到一定大小后自动删除。可以尝试用vi，tail，grep和less等命令查看这些日志文件。

###参考文档
[http://h2appy.blog.51cto.com/609721/781281/](http://h2appy.blog.51cto.com/609721/781281/)