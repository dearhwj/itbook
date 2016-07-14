# bower使用入门
原文地址：[http://jingyan.baidu.com/article/03b2f78c6bd7c05ea337ae6e.html](http://jingyan.baidu.com/article/03b2f78c6bd7c05ea337ae6e.html)


1. 全局安装bower

	npm install -g bower

1. 试着在项目文件夹下，下载jquery 和 underscore
	
	bower install jquery underscore
	
3. 然后就可以看到项目文件夹下多了一个app文件，里面有bower_components，再就去就是两个插件了包了
4. 初步这样也就行了，但是app/bower_components这个目录有点让人不习惯，我想把东西下载到我习惯的目录里。需要加一个.bowerrc文件。注意，不需要名字什么的，只要新增一个.bowerrc就行了。里面用可以定义下载目录

	```
	{
	  "directory": "app/vendor"
	}	
	```
5. 如果已经下载了很多必要的js，然后又不小心vendor文件夹删了，或者说另一个项目也需要类似的配置，难道还要一个一个输入命令吗？为了方便我们还要再加一个bower.json配置文件可以自己用文本编辑器新增一个，也可以用bower.init初始化
bower.init后，它会问你很多问题，一路默认就行了，然后文件夹里就会多一个bower.json。

6. bower install --save handlebars 后就会看到handlebar 在bower.json的dependencies里，如果不加--save就不会有。

7. 接下来删了app/vendor下的所有内容，然后bower install，他会把bower.json中的dependencies重新下载