# Linux/Mac命令行快捷键
发布日期：2016年3月28日

### 删除
*  ctrl + d 删除光标所在位置上的字符相当于VIM里x或者dl
*  ctrl + h 删除光标所在位置前的字符相当于VIM里hx或者dh
* ctrl + k 删除光标后面所有字符相当于VIM里d shift+$
* ctrl + u 删除光标前面所有字符相当于VIM里d shift+^
* ctrl + w 删除光标前一个单词相当于VIM里db
*  ctrl + y 恢复ctrl+u上次执行时删除的字符
* ctrl + ? 撤消前一次输入
* alt + r 撤消前一次动作
* alt + d 删除光标所在位置的后单词


### 移动
* ctrl + a 将光标移动到命令行开头相当于VIM里shift+^
* ctrl + e 将光标移动到命令行结尾处相当于VIM里shift+$
* ctrl + f 光标向后移动一个字符相当于VIM里l,***少用方向键，这样会减少你的左右手切换，比较轻松***
* ctrl + b 光标向前移动一个字符相当于VIM里h, ***少用方向键，这样会减少你的左右手切换，比较轻松***
* ctrl + 方向键左键 光标移动到前一个单词开头, ***这个在mac下不好用，需要特殊的配置,后面有说明***
* ctrl + 方向键右键 光标移动到后一个单词结尾, ***这个在mac下不好用，需要特殊的配置,后面有说明***
* ctrl + x 在上次光标所在字符和当前光标所在字符之间跳转,***这个在mac下不好用***
* alt + f 跳到光标所在位置单词尾部 


### 替换
* ctrl + t 将光标当前字符与前面一个字符替换
* alt + t 交换两个光标当前所处位置单词和光标前一个单词
* alt + u 把光标当前位置单词变为大写
* alt + l 把光标当前位置单词变为小写
* alt + c 把光标当前位置单词头一个字母变为大写
* ^oldstr^newstr 替换前一次命令中字符串

### 历史命令编辑
* ctrl + p 返回上一次输入命令字符
* ctrl + r 输入单词搜索历史命令
* alt + p 输入字符查找与字符相接近的历史命令
* alt + > 返回上一次执行命令


### mac下配置单词间移动的快捷键
iterm2按下面的中进行配置，然后用option+f前进一个单词, option+b 回退一个单词

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/iterm_moveword_setting.jpg)

### 参考资料
[linux命令行快捷键](http://www.nginx.cn/1114.html)
[linux命令行编辑快捷键](http://www.cnblogs.com/bo083/archive/2012/12/12/2815361.html)
[哪位大哥知道 Mac 终端光标在单词之间移动的快键](http://www.cnblogs.com/bo083/archive/2012/12/12/2815361.html)