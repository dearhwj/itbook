# Pick命令行模糊搜索工具
原文地址:[http://www.linuxidc.com/Linux/2018-01/150326.htm](http://www.linuxidc.com/Linux/2018-01/150326.htm)

### 使用方式

列出当前工作目录下的所有目录及其子目录，你可以用上下箭头选择你想进入的目录，然后按下回车就行了。

```
cd $(find.-type d | pick)

```

选择当前目录中的某个文件并用 less 来查看它


```
find-type f | pick |xargsless
```


