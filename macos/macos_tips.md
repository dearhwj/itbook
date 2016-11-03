# Mac Tips

[苹果鼠标移动速度太慢](http://bbs.feng.com/read-htm-tid-6658230.html)




[微信客户端截图]

Control + Command + W 隐藏
Control + Command + A 截图



[mac的窗口管理快捷方式]
	
	在当前软件窗口下进行同类切换
	command+` 这个快捷键是让你切换当前活跃软件的窗口，例如你打开了3个Safari窗口，那么+`  就可以在这三个窗口之间进行快速切换
	
	最小化当前窗口
	command+M 将当前的一个窗口最小化，并且最小化后可以在Dock中看到。需要的话点击即可放大还原。
	另外：最小化当前程序的所有窗口command+alt+M



[homebrew常用命令](http://my.oschina.net/gujianhan/blog/203704)



[8个不可不知的Mac OS X专用命令行工具](https://segmentfault.com/a/1190000000509514)

	open命令
	用于打开文件、目录或执行程序。就等同于在命令行模式下，重复图形界面“双击”的动作。
	
	pbcopy 和 pbpaste 
	这两个工具可以打通命令行和剪贴板。当然用鼠标操作复制粘贴也可以——但这两个工具的真正威力，发挥在将其用作Unix工具的时候。意思就是说：可以将这两个工具用作管道、IO重定向以及和其他命令的整合。
	
	screencapture
	screencapture命令可以截图。和Grab.app与cmd + shift + 3或cmd + shift + 4热键相似，但更加的灵活。
	
	say
	say是一个文本转语音（TTS）的有趣的工具，引擎和OS X使用的一样也是VoiceOver。如果不加其他选项，则会简单的语音朗读你给定的字符串。用-f选项朗读特定文本文件，-o选项将朗读结果存为音频文件而不是播放
	

[让 Mac OS X 终端显示颜色](http://blog.sina.com.cn/s/blog_6a60817301012p3e.html)

	要看彩色输出的ls、grep，加参数：
	ls -G
	grep --color

	要看彩色的vim，启动后输入：
	:syntax on

	要固定效果的话改一下参数文件，正常用bash的这样改：
	$ cd
	$ echo "export CLICOLOR=1" >> .bash_profile
	$ echo "alias grep='grep --color=auto'" >> .bash_profile
	$ echo "syntax on" >> .vimrc

	习惯用csh的这样改：
	% echo "setenv CLICOLOR 1" >> .cshrc

[Mac文件太大无法复制到u盘解决办法](http://www.pc6.com/edu/88142.html)

	目前大部分U盘出厂格式为FAT32，而这种格式是不支持存储4GB以上文件的，所以在拷贝一些高清电影、游戏等文件时会出现以上提示。如何解决这个问题呢，这还是很简单的，把 FAT32 格式转换为 ExFAT 即可，这里需要用到 MAC 系统中的一个工具——磁盘工具。

[mac系统同一程序不同窗口切换方法](http://www.win8xitong.cn/winodws10/46353.html)

	同一程序的多个窗口你会发现，虽然桌面上有好多窗口，但是，他们都是源自同一个应用程序。
	如果你想找到其中某一个窗口，这时候 Command+Tab 就不管用了。那么该怎么办呢?
	可以试试 Command+"~"

[MAC下JAVA的安装路径](http://www.blogjava.net/paulwong/archive/2014/07/12/415725.html)

	/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home


[简单命令行阻止Mac休眠](http://digi.it.sohu.com/20121218/n360779320.shtml)

	caffeinate -u -t 14400

[让Mac默认在当前文件夹下搜索的方法](http://www.2cto.com/os/201301/183562.html)

	在 Finder 偏好设置里调整[搜索当前文件夹]
	
	
	
[Mac 实用技巧：记住这几个快捷键，让光标指哪到哪](http://sspai.com/32769)

	「Command + 方向键上」将光标快速移动到整篇文本开头，
	「Command + 方向键下」快速移动到文章结尾。	
	「Option + 方向键上」将光标移动到当前段落的开头,如果光标在段落的开头，「Option + 方向键上」可以将光标移动到上一段落的开头
	「Option + 方向键下」移动到当前段落的末尾。而光标在段落结尾时，「Option + 方向键下」则将光标移动到下一段落的结尾
	「Command + 方向键左」，将光标移动到句子的开头
	「Command + 方向键右」，则是移动到句子的末尾。
	按下组合键「Option + Shift + 方向键上」，即可选中光标所在位置到段落开头的所有文本。
	按下「Option + Shift + 方向键下」，则是选中光标所在位置到段落结尾的所有文本。
	「Option + Shift + 方向键左/右」可以选中一个单词
	「Command + Shift +左/右」可以选中一句话。
	

[Linux、Windows、Mac文本文件转换](http://blog.csdn.net/yxc135/article/details/18909173)

	换行符的区别：
	Windows:     '\r\n'
	Mac:         '\r'
	Linux:       '\n'

	转换方式：
	Windows->Linux : sed -i 's/\r$//' file.txt
	Windows->Mac : cat old.txt | tr -d "\n" > new.txt
	Mac->Windows : cat old.txt | tr "\r" "\n" | sed 's/$/\r/' > new.txt
	Mac->Linux : cat old.txt | tr "\r" "\n" > new.txt
	Linux->Windows : sed -i 's/$/\r/' file.txt
	Linux->Mac : cat old.txt | tr "\n" "\r" > new.txt

	需要提醒的是，sed的处理方式是按行处理，对每行处理时\n已被忽略；tr不能替换单子符为多字符，tr "\r" "\r\n"是行不通的。