# JAVA虚拟机关闭钩子(Shutdown Hook)
[原文:JAVA虚拟机关闭钩子(Shutdown Hook)](http://blog.csdn.net/u013256816/article/details/50394923)


程序经常也会遇到进程挂掉的情况，一些状态没有正确的保存下来，这时候就需要在JVM关掉的时候执行一些清理现场的代码。JAVA中的ShutdownHook提供了比较好的方案。

JDK提供了Java.Runtime.addShutdownHook(Thread hook)方法，可以注册一个JVM关闭的钩子，这个钩子可以在一下几种场景中被调用：

1.  程序正常退出
2.  使用System.exit()
3.  终端使用Ctrl+C触发的中断
4.  系统关闭
5.  OutOfMemory宕机
6.  使用Kill pid命令干掉进程（注：在使用kill -9 pid时，是不会被调用的）下面是JDK1.7中关于钩子的定义：

```
public void addShutdownHook(Thread hook)  
参数：  
hook - An initialized but unstarted Thread object   
抛出：   
IllegalArgumentException - If the specified hook has already been registered, or if it can be determined that the hook is already running or has already been run   
IllegalStateException - If the virtual machine is already in the process of shutting down   
SecurityException - If a security manager is present and it denies RuntimePermission("shutdownHooks")  

从以下版本开始：   
1.3   
另请参见：  
removeShutdownHook(java.lang.Thread), halt(int), exit(int)  

```


