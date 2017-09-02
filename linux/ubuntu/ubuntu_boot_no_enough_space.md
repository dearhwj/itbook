# boot空间不足解决/Ubuntu升级出现
原文地址[http://blog.csdn.net/zht666/article/details/8776316](http://blog.csdn.net/zht666/article/details/8776316)

经常升级Linux内核，导致更新时警告/boot分区空间不足。这是以为多次升级内核后，导致内核版本太多，清理一下没用的内核文件就行了。命令如下：

```
 ls /boot
abi-3.5.0-17-generic         lost+found
abi-3.5.0-21-generic         memtest86+.bin
abi-3.5.0-26-generic         memtest86+_multiboot.bin
config-3.5.0-17-generic      System.map-3.5.0-17-generic
config-3.5.0-21-generic      System.map-3.5.0-21-generic
config-3.5.0-26-generic      System.map-3.5.0-26-generic
grub                         vmlinuz-3.5.0-17-generic
initrd.img-3.5.0-17-generic  vmlinuz-3.5.0-21-generic
initrd.img-3.5.0-21-generic  vmlinuz-3.5.0-26-generic
initrd.img-3.5.0-26-generic

```
可以看到都是一些内核启动文件，很明显有些是我们不需要的（建议先卸载比较老的内核），不需要的就当垃圾处删除吧。理论上，除正在用的其它的都可以卸载，但刚升级的东西可能不稳定，为保险起见，保留1-2个之前版本备用吧。

注意：卸载老的内核之前，首先用uname -a查看当前启动的是哪个内核（防止把当前正在使用的内核卸载了）：
```
zht@zht-Ubuntu:~$ uname -a
Linux zht-Ubuntu 3.5.0-26-generic #42-Ubuntu SMP Fri Mar 8 23:18:20 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
```

===============================
卸载旧的内核，命令如下：
//卸载linux-image-3.5.0-17-generic
```
zht@zht-Ubuntu:~$ sudo apt-get purge Linux-image-3.5.0-17-generic
之后根据提示输入yes即可完成卸载。

```