# Groovy的==的行为

在Java里，==意味着基本类型相等或对象类型相等。在Groovy里，就会更复杂一些：

1. 如果对象实现了Comparable ==会转换成a.compareTo(b)==0
2. 没有实现Comparable的对象，就是使用a.equals(b)
3. 否则检查基本类型，也就是is，比如a.is(b)