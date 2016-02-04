# API

[设计原则：小议 SPI 和 API]("http://www.cnblogs.com/happyframework/p/3325560.html")

	Service provider interface，“SPI”的规则如下：
	1. 概念上更依赖调用方。
	2. 组织上位于调用方所在的包中。
	3. 实现位于独立的包中。
	4. 常见的例子是：插件模式的插件。
	
	
	“API”的规则如下：
	1. 概念上更接近实现方。
	2. 组织上位于实现方所在的包中。
	3. 实现和接口在一个包中。