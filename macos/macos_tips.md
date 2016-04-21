# Mac Tips
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