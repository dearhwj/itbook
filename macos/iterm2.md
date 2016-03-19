# Iterm2 快捷键介绍

### 标签

1. 新建标签：command + t
2. 关闭标签：command + w
3. 切换标签：command + 数字 或 command + 左右方向键
4. 切换全屏：command + enter
5. 查找：command + f

### 分屏
1. 垂直分屏：command + d
2. 水平分屏：command + shift + d
3. 切换屏幕：command + option + 方向键 command + [ 或 command + ]

### 其他
1. 查看历史命令：command + ;
2. 查看剪贴板历史：command + shift + h

### Shell的常用快捷键
1. 清除当前行：ctrl + u
2. 到行首：ctrl + a
3. 到行尾：ctrl + e
4. 前进后退：ctrl + f/b (相当于左右方向键)
5. 上一条命令：ctrl + p
6. 搜索命令历史：ctrl + r
7. 删除当前光标的字符：ctrl + d
8. 删除光标之前的字符：ctrl + h
8. 删除光标之前的单词：ctrl + w
8. 删除到文本末尾：ctrl + k
8. 交换光标处文本：ctrl + t
8. 清屏1：command + r
8. 清屏2：ctrl + l

可以在 Preferences > keys 设置全局快捷键调出 iterm，这个也可以用过 Alfred 实现
我常用的一些快捷键
&#8984; + 1 / 2 左右 tab 之间来回切换，这个在 前面 已经介绍过了
&#8984;← / &#8984;→ 到一行命令最左边/最右边 ，这个功能同 C+a / C+e
&#8997;← / &#8997;→ 按单词前移/后移，相当与 C+f / C+b，其实这个功能在Iterm中已经预定义好了，&#8997;f / &#8997;b，看个人习惯了
好像就这几个。。囧
设置方法如下
当然除了这些可以自定义的也不能忘了 linux 下那些好用的组合
C+a / C+e 这个几乎在哪都可以使用
C+p / !! 上一条命令
C+k 从光标处删至命令行尾 (本来 C+u 是删至命令行首，但iterm中是删掉整行)
C+w A+d 从光标处删至字首/尾
C+h C+d 删掉光标前后的自负
C+y 粘贴至光标后
C+r 搜索命令历史，这个较常用
