# linux syslogd服务

原文地址:[http://blog.csdn.net/tonyxf121/article/details/7934824](http://blog.csdn.net/tonyxf121/article/details/7934824)
### 介绍

syslog是一种工业标准的协议，可用来记录应用程序或者设备的日志，日志一般都存储在/var/log目录下。可以通过查看日志记录，随时掌握系统状况。日志是通过syslogd这个进程记录系统有关事件记录，也可以记录应用程序运作事件。通过适当的配置，我们还可以实现运行syslog协议的机器间通信，通过分析这些网络行为日志，藉以追踪掌握与设备和网络有关的状况。

### 配置文件

syslog依据两个重要的文件：/etc/syslogd守护进程和/etc/syslog.conf配置文件。通常情况下，多数syslog信息被写到/var/adm或/var/log目录下的信息文件中。一个典型的syslog记录包括生成程序的名字和一个文本信息。它还包括一个设备和一个优先级范围。

通过使用syslog.conf文件，可以对生成的日志的位置及其相关信息进行灵活的配置。该配置文件指明了syslogd守护程序记录日志的行为，该程序在启动时查询配置文件。该文件由不同程序或消息分类的单个条目组成，每个占一行。对每类消息提供一个选择域和一个动作域，选择域指明消息的类型和优先级，动作域指明syslogd接收到一个与选择标准相匹配的消息时所执行的动作，这些域由tab隔开。

syslog.conf行的基本语法是：消息类型.优先级 动作域。其中，每个选择域是由消息类型和优先级组成。当指明一个优先级时，syslogd将记录一个拥有相同或更高优先级的消息。

* 下图中是一些主要的消息类型：

col 1    | col 2               
-------- | --------------------
消息类型     | 消息来源                
kern     | 内核                  
User     | 用户程序                
Damon    | 系统守护进程              
Mail     | 电子邮件系统              
Auth     | 与安全权限相关的命令          
Lpr      | 打印机                 
News     | 新闻组信息               
Uucp     | Uucp程序              
Cron     | 记录当前登录的每个用户信息       
wtmp     | 一个用户每次登录进入和退出时间的永久记录
Authpriv | 授权信息                

* 下图中是一些主要的消息类型：

col 1   | col 2    
------- | ---------
优先级     | 描述       
emerg   | 最高的紧急程度状态
alert   | 紧急状态     
Cirt    | 重要信息     
warning | 警告       
err     | 临界状态     
notice  | 出现不寻常的事情 
info    | 一般性消息    
Debug   | 调试级信息    
None    | 不记录任何日志信息

不同的服务类型有不同的优先级，数值较大的优先级涵盖数值较小的优先级。如果某个选择条件只给出了一个优先级而没有使用任何优先级限定符，对应于这个优先级的消息以及所有更紧急的消息类型都将包括在内。比如说，如果某个选择条件里的优先级是“warning”，它实际上将把“warning”、“err”、“crit”、“alert“和“emerg”都包括在内。

syslog允许人们使用三种限定符对优先级进行修饰：星号(*)、等号(=)和叹号(!)：

* 星号(*)的含义是把本项服务生成的所有日志消息都发送到操作动作指定的地点。就像它在规则表达式里的作用一样，星号代表“任何东西”；
* 等号(=)的含义是只把本项服务生成的本优先级的日志消息都发送到操作动作指定的地点。比如说，可以用“=”限定符只发送调试消息而不发送其他更紧急的消息(这将为应用程序减轻很多负担)。当你只需要发送特定优先级别的消息时，就要使用等号限定符；
* 叹号(!)的含义是把本项服务生成的所有日志消息都发送到操作动作指定的地点，但本优先级的消息不包括在内。

所以，根据上面介绍的相关知识，可以打开/etc/syslog.conf配置文件并查看其中内容，如下图：

![](http://img.my.csdn.net/uploads/201209/02/1346574526_8818.png)

**syslog进程**

syslogd守护程序是由/etc/rc.d/init.d/syslog脚本在运行级2下被调用的，缺省不使用选项。但有两个选项-r和-h很有用：

如果将要使用一个日志服务器，必须调用syslogd-r。缺省情况下syslogd不接受来自远程系统的信息。当指定-r选项，syslogd将会监听从514端口上进来的UDP包。

如果还希望日志服务器能传送日志信息，可以使用-h标志。缺省时，syslogd将忽略使其从一个远程系统传送日志信息到另一个系统的syslogd。

**syslog调用接口**

在实际的使用过程中，我们可以通过配置文件和查看相应的日志文件来使用syslog。然而，在许多应用场景下，我们往往需要通过程序产生输出信息并进行记录，也就是说要把一些信息写成日志文件，正常情况下运行程序的人不用关心日志里的内容，只有在出现问题的时候才会查看日志文件里的内容以确定问题所在。因此，下面将详细介绍如何通过syslog日志系统提供的API调用接口，来使用程序实现对syslog的使用。

在Linux中，提供了四个有关syslog日志系统的系统调用，供用户使用：

1. openlog：打开日志设备，以供读取和写入，与文件系统调用的open类似。该函数的声明如下：

void openlog(const char *ident, int option, int facility);

此函数用来打开一个到系统日志记录程序的连接，打开之后就可以用syslog或vsyslog函数向系统日志里添加信息了。而closelog函数就是用来关闭此连接的。

openlog的第一个参数ident是一个标记，ident所表示的字符串将固定地加在每行日志的前面以标识这个日志，通常就写成当前程序的名称以作标记。

第二个参数option一般是下列选项值取“与”运算(使用“|”表示，如“LOG_CONS | LOG_PID”)的结果：

LOG_CONS：如果送到system logger时发生问题，直接写入系统终端;

LOG_NDELAY：立即开启连接，通常连接是在第一次写入消息时才打开的;

LOG_PERROR：将消息也同时送到stderr设备;

LOG_PID：将进程PID含入所有消息中。

第三个参数facility指明记录日志的程序的类型，它主要具有如下几类日志类型：

LOG_AUTH ：安全/授权消息；

LOG_AUTHPRIV：安全/授权消息；

LOG_CRON：时间守护进程(cron和at)专用；

LOG_DAEMON：其它系统守护进程；

LOG_KERN：核心消息；

LOG_LOCAL0到LOG_LOCAL7：系统保留；

LOG_LPR：printer子系统；

LOG_MAIL：mail子系统；

LOG_NEWS：USENET新闻子系统；

LOG_SYSLOG：syslogd进程内部所产生的消息；

LOG_USER(缺省)：一般使用者缺省使用消息；

LOG_UUCP：UUCP子系统；

LOG_FTP：FTP子系统使用；

2. syslog：写入日志，与文件系统调用的write类似。syslog函数的声明如下：

void syslog(int priority, const char * message, ...);

第一个参数是消息的紧急级别priority，第二个参数是消息及其格式，之后是格式对应的参数，如同C语言里面printf输出函数一样使用，具体的格式由调用者自己定义。

这里还需要详细介绍一下第一个参数priority，它是由severity level和facility组成的。Facility已经在上面介绍了，下面介绍一下severity level，也就是消息的重要级别，它主要包括：

LOG_EMERG：紧急状况；

LOG_ALERT：高优先级问题，比如说数据库崩溃等，必须要立即采取反应行动；

LOG_CRIT：重要状况发生，比如硬件故障；

LOG_ERR：错误发生；

LOG_WARNING：警告发生；

LOG_NOTICE：一般状况，需要引起注意；

LOG_INFO：信息状况；

LOG_DEBUG：调试消息。

在平时的项目里通常只使用LOG_ERR、LOG_INFO和LOG_DEBUG。  

3. closelog：关闭日志设备，与文件系统调用的close类似。相对上述2个函数来说，该函数非常简单，其声明如下：

void closelog( void );

值得注意的是，虽然该函数的使用和调用情况非常简单，但是是必不可少的，因为在Linux系统中，打开的日志也是资源，如果只使用openlog函数打开日志，而忘记使用closelog关闭日志的话，当打开的日志数量累积到一定程度，便会造成内存不足，从而引起系统问题。所以，提醒用户在使用中特别注意。

4. vsyslog：它和syslog功能一样，负责写入日志，只是参数格式不同。

**例子**

```
#include <syslog.h>                                           
#include <stdio.h>                                            
#include <stdarg.h>                                           
                                                                
int main(void)                                                
{                                                             
	int log_test;                                             
 	/*打开日志*/                                              
	openlog("log_test ", LOG_PID|LOG_CONS, LOG_USER);         
   /*写日志*/                                                
	syslog(LOG_INFO, "PID information, pid=%d", getpid());    
   syslog(LOG_DEBUG,"debug message ");                       
	/*关闭日志*/                                              
	closelog();                                               
}                                                                                                                       

#include <syslog.h>                                         
#include <stdio.h>                                          
#include <stdarg.h>                                         

int main(void)                                              
{                                                           
    int log_test;                                           
    /*打开日志*/                                            
    openlog("log_test ", LOG_PID|LOG_CONS, LOG_USER);       
    /*写日志*/                                              
    syslog(LOG_INFO, "PID information, pid=%d", getpid());  
    syslog(LOG_DEBUG,"debug message ");                     
    /*关闭日志*/                                            
    closelog();                                             
} 

```                                                                                                                    
因为syslog.conf里配置项是：
```
*.info;mail.none;authpriv.none;cron.none        /var/log/messages
```
所以可以在/var/log/messages文件里看见运行结果：

```
Sep  2 17:10:39 log_test PID information, pid=25805
```
因为没有配置debug级别的，所以结果里并没有"debug message "这段内容，我们修改配置文件为：

```
\*.info;mail.none;authpriv.none;cron.none;user.debug        /var/log/messages
```
并重启syslog：/etc/init.d/syslog restart，这时再次运行给出的例子，在/var/log/messages中可以看见运行结果：

```
Sep  2 17:22:55 xen11 log_test [29698]: PID information, pid=29698  
Sep  2 17:22:55 xen11 log_test [29698]: debug message 
```
**配置日志文件服务器**

服务一般都会布置在几台机器上，需要查看日志的时候就得挨个机器上去，当然也有更方便的方法，就是布置一台日志服务器，其余的机器将日志都发送到日志服务器上，这样每次只需要到日志服务器上查看日志。

日志服务器会启动一个监听端口，默认的时UDP的514，而其余的机器会将日志转出一份发送到服务器，下面介绍服务器和客户端的配置：

1. 服务器端修改syslogd的启动配置文件，修改/etc/sysconfig/syslog配置项 SYSLOGD_OPTIONS="-m 0" 为 SYSLOGD_OPTIONS="-m 0 -r"；

2. 重启syslog：sudo /etc/init.d/syslog restart，重启之后可以在netstat中看见：udp        0      0 0.0.0.0:514                 0.0.0.0:*                               11423/syslogd ；  

3. 修改客户端syslog.conf，只需要在客户端的/etc/syslog.conf里添加：*.*               @192.168.1.100。重启客户端的syslog后所有的新增日志都将发送到日志服务器192.168.1.100.