# Javascript Tips
[Unicode与JavaScript详解]("http://www.ruanyifeng.com/blog/2014/12/unicode.html")

[JavaScript中对象的属性]("http://www.cnblogs.com/ziyunfei/archive/2012/10/30/2745786.html")

JavaScript中有三种不同类型的属性:命名数据属性(named data properties),命名访问器属性(named accessor properties)以及内部属性(internal properties).


[JavaScript 操作 Cookie]("http://www.cnblogs.com/Darren_code/archive/2011/11/24/Cookie.html")

[JavaScript中String和JSON之间的转换]("http://blog.csdn.net/ymjring/article/details/7633942")



[JS 对象（Object）和字符串（String）互转]("http://blog.csdn.net/starrexstar/article/details/8083259")

利用原生JSON对象，将对象转为字符串

	[javascript] view plaincopy
	var jsObj = {};  
	jsObj.testArray = [1,2,3,4,5];  
	jsObj.name = 'CSS3';  
	jsObj.date = '8 May, 2011';  
	var str = JSON.stringify(jsObj);  
	alert(str);  

从JSON字符串转为对象

	[javascript] view plaincopy
	var jsObj = {};  
	jsObj.testArray = [1,2,3,4,5];  
	jsObj.name = 'CSS3';  
	jsObj.date = '8 May, 2011';  
	var str = JSON.stringify(jsObj);  
	var str1 = JSON.parse(str);  
	alert(str1);  


[JavaScript标签script中的defer和async]("http://blog.csdn.net/ymjring/article/details/43566127")


[javascript “||”、“&&”的灵活运用]("http://www.tashan10.com/javascript-de-ling-huo-yun-yong/")

1. 在javascript中，“&&”运算符运算法则如下：
如果&&左侧表达式的值为真值，则返回右侧表达式的值；否则返回左侧表达式的值。
2. “||”运算符的运算法则如下：如果||左侧表达式的值为真值，则返回左侧表达式的值；否则返回右侧表达式的值。