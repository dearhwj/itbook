# webpack
[一小时包教会 —— webpack 入门指南](http://www.w2bc.com/Article/50764)


	webpack 的优势
	其优势主要可以归类为如下几个：
	1. webpack 是以 commonJS 的形式来书写脚本滴，但对 AMD/CMD 的支持也很全面，方便旧项目进行代码迁移。
	2. 能被模块化的不仅仅是 JS 了。
	3. 开发便捷，能替代部分 grunt/gulp 的工作，比如打包、压缩混淆、图片转base64等。
	4. 扩展性强，插件机制完善，特别是支持 React 热插拔（见 react-hot-loader ）的功能让人眼前一亮。

	一. 安装
	我们常规直接使用 npm 的形式来安装：
	$ npm install webpack -g
	当然如果常规项目还是把依赖写入 package.json 包去更人性化：
	$ npm init
	$ npm install webpack --save-dev
	
	