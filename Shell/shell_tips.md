# Shell Tips
[Shell中获取当前IP地址](http://www.cnblogs.com/wangkangluo1/archive/2012/04/13/2446163.html)

```
LC_ALL=C ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' |
cut -d: -f2 | awk '{ print $1}'

```
[shell 中获取当前工作路径和命令文件所在绝对路径](http://blog.csdn.net/samxx8/article/details/51254546)
	
	basepath=$(cd `dirname $0`; pwd)

[Shell(Bash)中如何判断是否存在某个命令](https://segmentfault.com/q/1010000000156870)
	
	最好避免使用 which，做为一个外部的工具，并不一定存在，在发行版之间也会有区别，有的系统的 which 命令不会设置有效的 exit status，存在一定的不确定性。

	Bash 有提供一些内建命令如 hash、type、command 也能达到要求。


[shell脚本中echo显示内容带颜色](http://www.cnblogs.com/lr-ting/archive/2013/02/28/2936792.html)

	shell脚本中echo显示内容带颜色显示,echo显示带颜色，需要使用参数-e 
	格式如下：
	echo -e "\033[字背景颜色；文字颜色m字符串\033[0m" 
	echo -e "\033[41;36m something here \033[0m" 
	
	其中41的位置代表底色， 36的位置是代表字的颜色 
	

[每个极客都应该知道的Linux技巧]()

	检查不是由你运行的程序
	ps aux | grep -v `whoami`
	
  	最占用时间的前十个程序
  	ps aux--sort=-%cpu | grep -m 11 -v `whoami`

[shell/命令行下的光标移动等操作技巧]("http://blog.163.com/fenglang_2006/blog/static/13366231820110533940446/")

	C-r 查找历史执行命令，很便捷的调用历史命令的方式，输入历史命令关键字，就会及时显示匹配命令，enter 即可执行

	C-p 前一条指令

	C-n 后一条指令

	C-c 终止已经运行的命令(针对还没有运行完的命令和脚本，实际为向相关进程发送中断信号)或者取消已经输入的命令

	C-o/C-j/C-m 执行当前行输入的命令，跟 enter 类似

	C-l 清屏，clear 命令

	C-a 移动光标到行首

	C-e 移动光标到行尾

	C-t 交换光标前俩字符的位置

	C-h 往后删除一字符

	C-d 往前删除一字符

	C-b 往后移动一个字符

	C-f 往前移动一个字符

	下面几个操作原理估计类似 emacs 的 yank 操作，可以理解为一套独立的粘贴板机制:
	C-w 剪切前一个单词(空格间隔的字符串单元)

	C-u 剪切到行首

	C-k 剪切到行尾

	C-y 粘贴剪切
	
[linux shell 快捷键](http://blog.chinaunix.net/uid-361890-id-342066.html)	
		
	 