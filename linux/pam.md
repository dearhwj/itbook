# PAM

## PAM 的使用历史记录
PAM 是关注如何为服务验证用户的 API。在使用 PAM 之前，诸如 login（和 rlogin、telnet、rsh）之类的应用程序在 /etc/passwd 中查找用户名，然后将两者相比较并验证用户输入的名称。所有应用程序使用了这些共享服务，但是并未共享实现细节和配置这些服务的权限。

## 什么是PAM(Pluggable Authentication Module)
PAM即可插拔认证模块。它提供了对所有服务进行认证的中央机制，适用于login，远程登录（telnet,rlogin,fsh,ftp,点对点协议（PPP）），
su等应用程序中。系统管理员通过PAM配置文件来制定不同应用程序的不同认证策略；应用程序开发者通过在服务程序中使用PAM API(pam_xxxx( ))来实现对认证方法的调用；
而PAM服务模块的开发者则利用PAM SPI来编写模块（主要是引出一些函数pam_sm_xxxx( )供PAM接口库调用），将不同的认证机制加入到系统中；PAM接口库（libpam）
则读取配置文件，将应用程序和相应的PAM服务模块联系起来



PAM 将提供不同的功能，例如单点登录验证、访问控制等。每个功能的实现都是由不同的模块处理的。下面是一些主要模块：

```
pam_access 将使用登录名/域名，根据 /etc/security/access.conf 中的预定义规则交付日志守护进程样式的登录访问控制。
pam_cracklib 将根据密码规则检查密码。
pam_env sets/unsets 环境变量来自 /etc/security/pam_env_conf。
pam_debug 将调试 PAM。
pam_deny 将拒绝 PAM 模块。
pam_echo 将打印消息。
pam_exec 将执行外部命令。
pam_ftp 是匿名访问模块。
pam_localuser 要求将用户列于 /etc/passwd 中。
pam_unix 将通过 /etc/passwd 提供传统密码验证。

```
还有许多其他模块（pam_userdb、pam_warn、pam_xauth），这些模块将获取返回的一组值（这些模块的详细信息可以在 参考资料 的 PAM 管理指南中找到）。



## PAM的配置文件和验证过程

```

# grep -v ^# /etc/pam.d/system-auth
auth        required      pam_env.so
auth        sufficient    pam_unix.so nullok try_first_pass
auth        requisite     pam_succeed_if.so uid >= 500 quiet
auth        required      pam_deny.so
 
account     required      pam_unix.so
account     sufficient    pam_succeed_if.so uid < 500 quiet
account     required      pam_permit.so
 
password    requisite     pam_cracklib.so try_first_pass retry=3
password    sufficient    pam_unix.so md5 shadow nullok try_first_pass use_authtok
password    required      pam_deny.so
 
session     optional      pam_keyinit.so revoke
session     required      pam_limits.so
session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
session     required      pam_unix.so
```


login 的 PAM 验证机制流程是这样的：
验证阶段 (auth)：首先，(a)会先经过 pam_securetty.so 判断，如果使用者是 root 时，则会参考 /etc/securetty 的配置；接下来(b)经过 pam_env.so 配置额外的环境变量；再(c)透过 pam_unix.so 检验口令，若通过则回报 login 程序；若不通过则(d)继续往下以 pam_succeed_if.so 判断 UID 是否大于 500 ，若小于 500则回报失败，否则再往下(e)以 pam_deny.so 拒绝联机。

授权阶段 (account)：(a)先以 pam_nologin.so 判断 /etc/nologin 是否存在，若存在则不许一般使用者登陆；(b)接下来以 pam_unix 进行账号管理，再以 (c) pam_succeed_if.so 判断 UID 是否小于 500 ，若小于 500 则不记录登录信息。(d)最后以 pam_permit.so 允许该账号登陆。

口令阶段 (password)：(a)先以 pam_cracklib.so 配置口令仅能尝试错误 3 次；(b)接下来以pam_unix.so 透过 md5, shadow 等功能进行口令检验，若通过则回报 login 程序，若不通过则 (c)以 pam_deny.so 拒绝登陆。

会议阶段 (session)：(a)先以 pam_selinux.so 暂时关闭 SELinux；(b)使用 pam_limits.so 配置好用户能够操作的系统资源； (c)登陆成功后开始记录相关信息在登录文件中； (d)以 pam_loginuid.so 规范不同的 UID 权限；(e)开启 pam_selinux.so 的功能。
总之，就是依据验证类别 (type) 来看，然后先由 login 的配置值去查阅，如果出现『 include system-auth 』就转到 system-auth 文件中的相同类别，去取得额外的验证流程就是了。然后再到下一个验证类别，最终将所有的验证跑完！就结束这次的 PAM 验证啦！

经过这样的验证流程，现在你知道为啥 /etc/nologin 存在会有问题，也会知道为何你使用一些远程联机机制时，老是无法使用 root 登陆的问题了吧？没错！这都是 PAM 模块提供的功能啦！


### 参考资料
[Linux可插拔认证模块的基本概念与架构](http://www.infoq.com/cn/articles/wjl-linux-pluggable-authentication-module)

[了解和配置 PAM](https://www.ibm.com/developerworks/cn/linux/l-pam/)

[ login (登录)的 PAM 验证机制流程](http://blog.csdn.net/wangzengdi/article/details/31742267)

