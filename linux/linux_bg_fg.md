#  Linux的bg和fg命令介绍

& 最经常被用到 这个用在一个命令的最后，可以把这个命令放到后台执行

ctrl + z 可以将一个正在前台执行的命令放到后台，并且暂停

jobs 查看当前有多少在后台运行的命令

fg 将后台中的命令调至前台继续运行,如果后台中有多个命令，可以用 fg %jobnumber将选中的命令调出，%jobnumber是通过jobs命令查到的后台正在执行的命令的序号(不是pid)

bg 将一个在后台暂停的命令，变成继续执行,如果后台中有多个命令，可以用bg %jobnumber将选中的命令调出%jobnumber是通过jobs命令查到的后台正在执行的命令的序号(不是pid)





### 参考资料
[Linux的bg和fg命令简单介绍](http://www.jb51.net/LINUXjishu/65800.html)