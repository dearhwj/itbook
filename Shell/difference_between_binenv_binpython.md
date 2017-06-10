#  #!/usr/bin/env python与#!/usr/bin/python的区别

脚本语言的第一行，目的就是指出，你想要你的这个文件中的代码用什么可执行程序去运行它，就这么简单

\#!/usr/bin/Python是告诉操作系统执行这个脚本的时候，调用/usr/bin下的python解释器；
\#!/usr/bin/env python这种用法是为了防止操作系统用户没有将python装在默认的/usr/bin路径里。当系统看到这一行的时候，首先会到env设置里查找python的安装路径，再调用对应路径下的解释器程序完成操作。
\#!/usr/bin/python相当于写死了python路径;
\#!/usr/bin/env python会去环境设置寻找python目录,推荐这种写法