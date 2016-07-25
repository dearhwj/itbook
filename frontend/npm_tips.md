# NPM Tips
[NPM 中文文档](http://www.npmjs.com.cn/)

[package.json for NPM 文件详解](http://ju.outofmemory.cn/entry/130809)
	
	scripts:通过设置这个可以使NPM调用一些命令脚本，封装一些功能。


[请问 npm install --save 与 npm install --save-dev 的区别](http://cnodejs.org/topic/54d33df497be414b68dcf503)

	一个放在package.json 的dependencies , 一个放在devDependencies里面
	产品模式用dependencies，开发模式用devDep。所以，猜猜test相关npm该放到哪里？

[淘宝 NPM 镜像](http://npm.taobao.org/)

	镜像使用方法（三种办法任意一种都能解决问题，建议使用第三种，将配置写死，下次用的时候配置还在）:

	1.通过config命令

	npm config set registry https://registry.npm.taobao.org 
	npm info underscore （如果上面配置正确这个命令会有字符串response）
	2.命令行指定

	npm --registry https://registry.npm.taobao.org info underscore 
	3.编辑 ~/.npmrc 加入下面内容

	registry = https://registry.npm.taobao.org

[nodejs npm常用命令](http://www.cnblogs.com/linjiqin/p/3765772.html)
	

[NPM小结](http://www.tuicool.com/articles/VB7nYn)

[npm install 本地安装与全局安装的区别](http://www.cr173.com/html/25390_1.html)

	本地安装
	1. 将安装包放在 ./node_modules 下（运行npm时所在的目录）
	2. 可以通过 require() 来引入本地安装的包
	全局安装
	1. 将安装包放在 /usr/local 下
	2. 可以直接在命令行里使用


