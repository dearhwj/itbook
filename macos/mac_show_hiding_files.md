# Mac系统如何显示隐藏文件
原文地址:[https://www.zhihu.com/question/24635640](https://www.zhihu.com/question/24635640)




### 切换显示/隐藏

在终端（Terminal）输入如下命令，即可显示隐藏文件和文件夹

```
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```
如需再次隐藏原本隐藏的文件和文件夹，可以输入如下命令


```
defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder
 
```


### 临时性切换显示/隐藏

```
Command+Shift+.

```


