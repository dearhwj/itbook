# Moden Javascipt

[使用＂立即执行函数＂（Immediately-Invoked Function Expression，IIFE）](http://www.ithao123.cn/content-5615777.html)

[Javascript 严格模式详解](http://www.ruanyifeng.com/blog/2013/01/javascript_strict_mode.html)

```
	设立"严格模式"的目的，主要有以下几个：
	　　- 消除Javascript语法的一些不合理、不严谨之处，减少一些怪异行为;
　　	   - 消除代码运行的一些不安全之处，保证代码运行的安全；
	　　- 提高编译器效率，增加运行速度；

　　		- 为未来新版本的Javascript做好铺垫。

　　	"use strict";	
　　	老版本的浏览器会把它当作一行普通字符串，加以忽略。
```
[传统 Ajax 已死，Fetch 永生](https://segmentfault.com/a/1190000003810652)

[Javascript模块化编程（二）：AMD规范](http://www.ruanyifeng.com/blog/2012/10/asynchronous_module_definition.html)


[浏览器加载 CommonJS 模块的原理与实现](http://www.ruanyifeng.com/blog/2015/05/commonjs-in-browser.html)

[React学习笔记—JSX](https://segmentfault.com/a/1190000002646155)

	React.render方法可以渲染HTML结构，也可以渲染React组件。
	渲染HTML标签，声明变量采用首字母小写
	
	var myDivElement = <div className="foo" />;
	React.render(myDivElement, document.body);
	
	
	渲染React组件，声明变量采用首字母大写
	var MyComponent = React.createClass({/*...*/});
	var myElement = <MyComponent someProperty={true} />;
	React.render(myElement, document.body);
	
	标签的属性class和for，需要写成className和htmlFor。因为两个属性是JavaScript的保留字和关键字。无论你是否使用JSX。
	
	
	表达式用{}包起来，不要加引号，加引号就会被当成字符串。

	JSX是HTML和JavaScript混写的语法，当遇到<，JSX就当HTML解析，遇到{就当JavaScript解析。



[js中let和var定义变量的区别](http://zhidao.baidu.com/question/329685205173520085.html)

	js中let和var定义变量的区别，主要体现在作用于的不同。
	var定义的变量是全局变量或者函数变量。

	let定义的变量是块级的变量。
	例如：
	while(1){
    	let let1 = 2;

    	var var1 = 2;

	}
    	alert(let1);  //不可访问

	    alert(var1);  //可以访问

	也就是说，let只对它所在的最内侧块内有效，而var的范围至少是一个函数之内。