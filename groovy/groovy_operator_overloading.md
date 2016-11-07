# Groovy运算符重载
[原文]（http://www.cnblogs.com/rollenholt/archive/2013/10/02/3349047.html）

| Operator |Method|
----| ---
|a + b| a.plus(b)|
|a-b|a.minus(b)|
|a * b|a.multiply(b)|
|a ** b|a.power(b)|
|a / b|a.div(b)|
|a % b|a.mod(b)|
|a | b|a.or(b)|
|a & b|a.and(b)|
|a ^ b|a.xor(b)|
|a++ or ++a|a.next()|
|a– or –a|a.previous()|
|a[b]|a.getAt(b)|
|a[b] = c|a.putAt(b, c)|
|a << b|a.leftShift(b)|
|a >> b|a.rightShift(b)|
|switch(a) { case(b) : }|b.isCase(a)|
|~a|a.bitwiseNegate()|
|-a|a.negative()|
|+a|a.positive()|


另外需要注意的是下面的所有的操作符，在遇到null的时候，都不会抛出java.lang.NullPointerException

