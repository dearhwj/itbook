# YAML教程


YAML 是专门用来写配置文件的语言，非常简洁和强大，远比 JSON 格式方便。


## 语法

### 基本语法

1. 大小写敏感
2. 使用缩进表示层级关系
3. 缩进时不允许使用Tab键，只允许使用空格。
4. 缩进的空格数目不重要，只要相同层级的元素左侧对齐即可 
5. \# 表示注释，从这个字符一直到行尾，都会被解析器忽略。

### 数据结构
YAML 支持的数据结构有三种

1. 对象：键值对的集合，又称为映射（mapping）/ 哈希（hashes） / 字典（dictionary）
2. 数组：一组按次序排列的值，又称为序列（sequence） / 列表（list）
3. 纯量（scalars）：单个的、不可再分的值


### 对象
对象的一组键值对，使用冒号结构表示。

	animal: pets

转为 JavaScript 如下。

	{ animal: 'pets' }

Yaml 也允许另一种写法，将所有键值对写成一个行内对象。
	
	hash: { name: Steve, foo: bar } 
	{ hash: { name: 'Steve', foo: 'bar' } }
	
### 数组

一组连词线开头的行，构成一个数组。
	
	- Cat
	- Dog
	- Goldfish	
转为 JavaScript 如下

	[ 'Cat', 'Dog', 'Goldfish' ]	

数据结构的子成员是一个数组，则可以在该项下面缩进一个空格。

	-
	 - Cat
	 - Dog
	 - Goldfish

转为 JavaScript 如下

	[ [ 'Cat', 'Dog', 'Goldfish' ] ]

数组也可以采用行内表示法。

	animal: [Cat, Dog]	
	
转为 JavaScript 如下

	{ animal: [ 'Cat', 'Dog' ] }
	
### 纯量

纯量是最基本的、不可再分的值。以下数据类型都属于 JavaScript 的纯量。

* 字符串
* 布尔值：布尔值用true和false表示
* 整数
* 浮点数
* Null：null用~表示
* 时间：时间采用 ISO8601 格式；2001-12-14t21:59:43.10-05:00 ；
* 日期	：日期采用复合 iso8601 格式的年、月、日表示。1976-07-31

YAML 允许使用两个感叹号，强制转换数据类型。
	
	e: !!str 123
	f: !!str true
	
### 字符串
字符串默认不使用引号表示。

如果字符串之中包含空格或特殊字符，需要放在引号之中。单引号和双引号都可以使用，双引号不会对特殊字符转义。	
	
	s1: '内容\n字符串'
	s2: "内容\n字符串" 	
	转为 JavaScript 如下。
	{ s1: '内容\\n字符串', s2: '内容\n字符串' }
	
单引号之中如果还有单引号，必须连续使用两个单引号转义。


字符串可以写成多行，从第二行开始，必须有一个单空格缩进。换行符会被转为空格。

	str: 这是一段
  	  多行
      字符串
	转为 JavaScript 如下。
	{ str: '这是一段 多行 字符串' }
	
多行字符串可以使用|保留换行符，也可以使用>折叠换行。

	this: |
  	  Foo
  	  Bar
	that: >
  	  Foo
      Bar	
      
转为 JavaScript 代码如下。	

	{ this: 'Foo\nBar\n', that: 'Foo Bar\n' }

\+ 表示保留文字块末尾的换行，- 表示删除字符串末尾的换行。

	s1: |
	  Foo

	s2: |+
	  Foo


	s3: |-
	  Foo 
	转为 JavaScript 代码如下。

	{ s1: 'Foo\n', s2: 'Foo\n\n\n', s3: 'Foo' }  

### 引用
锚点&和别名*，可以用来引用。

```
defaults: &defaults
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  <<: *defaults

test:
  database: myapp_test
  <<: *defaults
```

&用来建立锚点（defaults），<<表示合并到当前数据，*用来引用锚点。



```
defaults:
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  adapter:  postgres
  host:     localhost

test:
  database: myapp_test
  adapter:  postgres
  host:     localhost  
```  

### 模拟器
[JS-YAML demo](http://nodeca.github.io/js-yaml/)
	
### 参考资料
[YAML 语言教程](http://www.ruanyifeng.com/blog/2016/07/yaml.html?f=tt)
