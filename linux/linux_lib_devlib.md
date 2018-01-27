# Linux devel包 和 非devel包的区别
原文地址:[https://zhidao.baidu.com/question/305166397742885564.html](https://zhidao.baidu.com/question/305166397742885564.html)


devel 包主要是供开发用，至少包括以下2个东西:

1. 头文件
2. 链接库

有的还含有开发文档或演示代码。

以 glib 和 glib-devel 为例:

如果你安装基于 glib 开发的程序，只需要安装 glib 包就行了。但是如果你要编译使用了 glib 的源代码，则需要安装 glib-devel。