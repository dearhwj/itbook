# 几个有用的mac命令

### open
open命令用于打开文件、目录或执行程序。就等同于在命令行模式下，重复图形界面“双击”的动作。

open命令可以有以下几种灵活的用法

1. 在命令行中打开指定的目录

	open  '目录'
	写一个灵活的shell function，这样调用open_find ~  就会新开一个find窗口
	
	```	
	function open_find(){
          OPEN_PATH='.'
          if [ $# -eq 1 ] ; then
                  OPEN_PATH=$1
          fi
          open $OPEN_PATH
  	}	
  	```

### 阻止mac睡眠

caffeinate -u -t 14400

[简单命令行阻止Mac休眠](http://digi.it.sohu.com/20121218/n360779320.shtml)


### 简单的TTS文本到语音的转换
	
```
	$ say "Never trust a computer you can't lift."
	
```
用-f选项朗读特定文本文件，-o选项将朗读结果存为音频文件而不是播放：

```
	$ say -f mynovel.txt -o myaudiobook.aiff
```
  	