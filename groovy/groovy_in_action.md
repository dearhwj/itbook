# 《Groovy In Action》阅读笔记


![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/groovy_content.png)

### GroovyBeans
groovyBook.tit le不是类属性的直接访问 ,它是访问该属性访问者方法的快捷方式。


### GStrings在groovy中,字符串能出现在单引号或者双引号中,在双引号的字符串中允许使用占位 符,占位符在需要的时候将自动解析,这是一个GString类型
```
def nick = 'Gina'def book = 'Groovy in Action'assert "$nick is $book" == 'Gina is Groovy in Action'
```
Groovy类生成器生成的字节 码必然不同于ja va编译器生成的字节码(不是在格式方 面,而是在内容方面),假设一个groovy文件包括一个像foo语句 ,groovy产生的字节码 不是直接调用这个方法的,而是像这样:getMetaClass().invokeMethod(this, "foo", EMPTY_PARAMS_ARRAY)
在一个Gstrin g中,可以通过 $符号简单的引用到一个变量。通过${}符号表示的完全表达式,在花括号中可以是任意的groovy表达式,花括号表示一个闭包。
### 重载操作符
[groovy–运算符重载](http://www.cnblogs.com/rollenholt/archive/2013/10/02/3349047.html)
