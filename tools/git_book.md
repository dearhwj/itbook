GitBook是一个基于 Node.js 的命令行工具，可使用 Github/Git 和 Markdown 来制作精美的电子书,GitBook 并非关于 Git 的教程。
GitBook支持输出多种文档格式：
静态站点：GitBook默认输出该种格式，生成的静态站点可直接托管搭载Github Pages服务上；
+ PDF：需要安装gitbook-pdf依赖；
+ eBook：需要安装ebook-convert；
+ 单HTML网页：支持将内容输出为单页的HTML，不过一般用在将电子书格式转换为PDF或eBook的中间过程；
+ JSON：一般用于电子书的调试或元数据提取。
使用GitBook制作电子书，必备两个文件：README.md和SUMMARY.md

README.md 它应该是你的图书的介绍. 它可以自动的被加到最终的summary中.
SUMMARY.md 定义了你的图书的结构. 它应该包含章节的列表,以及它们的链接.不被SUMMARY.md包含的文件不会被gitbook处理.

[如何用gitbook写书](http://blog.csdn.net/maray/article/details/50067821)

	生成pdf格式电子书
	gitbook pdf .
	如果希望生成epub或者mobi格式的，分别执行下面的命令即可：
	gitbook epub .
	gitbook mobi .
	
	
[Gitbook简明教程](http://www.colobu.com/2014/10/09/gitbook-quickstart/)	