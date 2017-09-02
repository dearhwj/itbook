# ldd命令

原文地址[http://blog.csdn.net/qq_26819733/article/details/50610129](http://blog.csdn.net/qq_26819733/article/details/50610129)


ldd本身不是一个程序，而仅是一个shell脚本：ldd可以列出一个程序所需要得动态链接库（so）
我们可以用which命令找到ldd的位置：

```
$ which ldd
/usr/bin/ldd

```



ldd命令通常使用"-v"或"--verbose"选项来显示所依赖的动态连接库的尽可能的详细信息。
即可得到/bin/ls命令的相关共享库文件列表：
```
root@xxhui:/home/hui# ldd /bin/ls
linux-vdso.so.1 (0x00007ffeeffc3000)
libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007f8e631c7000)
libacl.so.1 => /lib/x86_64-linux-gnu/libacl.so.1 (0x00007f8e62fbe000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f8e62c19000)
libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f8e629a9000)
libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f8e627a5000)
/lib64/ld-linux-x86-64.so.2 (0x00005599a18e8000)
libattr.so.1 => /lib/x86_64-linux-gnu/libattr.so.1 (0x00007f8e6259f000)
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f8e62382000)
```
注意：在 ldd 命令打印的结果中，“=>”左边的表示该程序需要连接的共享库之 so 名称，右边表示由 Linux 的共享库系统找到的对应的共享库在文件系统中的具体位置。默认情况下，/etc/ld.so.conf 文件中包含有默认的共享库搜索路径。
