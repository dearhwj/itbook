# 在Groovy中使用字符串

发布时间： 2016年3月8日

GStrings不同于Java strings在于它们允许以${..}的语法嵌入变量。如果一个字符串由双引号或三重引号括起来，并且包含一个非转义符（unescaped）$，它必定是groovy.lang.GString的一个实例；否则，就是java.lang.String的一个实例。

${..}里可以包含任意有效的Groovy表达式，包括方法调用或变量名。只有调用GString的toString方法时（例如，把结果输出到控制台），${..}表达式才被求值。

	firstWord = 'Hello' 
 
	secondWord = 'dlroW' 
 
	println  "$firstWord ${secondWord.reverse()}" 
	
	
${..}里可以包含任意有效的Groovy表达式，包括方法调用或变量名。只有调用GString的toString方法时（例如，把结果输出到控制台），${..}表达式才被求值。


填充（pad）字符串：
	
	assert 'Hello'.padRight(7,'*') == 'Hello**' 
 
	assert 'Hello'.padLeft(7,'*') == '**Hello' 
 
	assert 'Hello'.center(9,'*') == '**Hello**' 

分解字符串：	
	
	s = "The quick brown fox jumps over the lazy dog" 
 
	assert s.tokenize() == ['The','quick','brown','fox','jumps','over','the','lazy','dog']  
 
	assert s.tokenize() == new StringTokenizer(s).collect{it}  
 
	s1 = "The,quick*brown*fox,*jumps*over*the*lazy*dog" 
 
	assert s1.tokenize(',*') == s.tokenize()  	
	
查询字符串：

	alphabets = new String('a' .. 'z' as char[])  
 
	assert alphabets.find{it > 'f'} == 'g' //First one found  
 
	assert alphabets.findAll{it > 'f'} == 'g' .. 'z'//ALl found  
 
	assert alphabets.findIndexOf{ it > 'f'} == alphabets.indexOf('g')  
 
	assert alphabets.every {it > 'A'}  
 
	assert alphabets.any{it < 'c'}  
 
	assert alphabets.startsWith('abc')  
 
	assert alphabets.endsWith('xyz')  
 
	assert alphabets.contains('def')  
 
	assert alphabets.indexOf('c') == 2 
 
	assert alphabets.indexOf('d') == alphabets.lastIndexOf('d')  
 
	assert alphabets.count('a') == 1 		


字符串操作符：

	assert 'hello' + ' world' - 'l' == 'helo world' //Subtracts at most one l  
 
	assert ('Today is Sunday' - 'Sunday').trim() == 'Today is' 
 
	assert 'hello ' * 2 == 'hello hello ' 
 
	def empty = []  
 
	assert 'abc'.each{empty << it} == 'abc' 
 
	assert 'abc'.next() == 'abd' 
 
	assert 'abc'.previous() == 'abb'
	
下标操作符：

	assert 'hello'[1] == 'e' 
 
	assert 'hello'[2..'hello'.size() - 1] == 'llo' 
 
	assert 'hello'[0,2,4] == 'hlo' 
 
	assert 'hello'[-4,-2] == 'el' 	
	
### GString Lazy-Evaluation

GString’s lazy evaluation is a very powerful concept. However, use caution not to trip over that string. If we expect our references used in expressions to change and we want their current value to be used in the lazy evaluation, we must remember not to place them directly in the expressions, but rather within a no-parameter closure.

	quote = "Today ${-> company } stock closed at ${-> price }"      stocks.each { key, value ->        company = key        price = value        println quote	}	
### 参考文档
[http://developer.51cto.com/art/200906/129168.htm](http://developer.51cto.com/art/200906/129168.htm)	