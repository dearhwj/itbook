# BitSet的使用以及源代码分析

## 基本原理

BitSet是位操作的对象，值只有0或1即false和true，内部维护了一个long数组，初始只有一个long，所以BitSet最小的size是64，当随着存储的元素越来越多，BitSet内部会动态扩充，最终内部是由N个long来存储，这些针对操作都是透明的。

用1位来表示一个数据是否出现过，0为没有出现过，1表示出现过。使用用的时候既可根据某一个是否为0表示，此数是否出现过。

一个1G的空间，有 8*1024*1024*1024=8.58*10^9bit，也就是可以表示85亿个不同的数

## 主要的方法 
```
public void set(int pos): 位置pos的字位设置为true。 
public void set(int bitIndex, boolean value) 将指定索引处的位设置为指定的值。 
public void clear(int pos): 位置pos的字位设置为false。
public void clear() : 将此 BitSet 中的所有位设置为 false。 
public int cardinality() 返回此 BitSet 中设置为 true 的位数。 
public boolean get(int pos): 返回位置是pos的字位值。 
public void and(BitSet other): other同该字位集进行与操作，结果作为该字位集的新值。 
public void or(BitSet other): other同该字位集进行或操作，结果作为该字位集的新值。 
public void xor(BitSet other): other同该字位集进行异或操作，结果作为该字位集的新值。
public void andNot(BitSet set) 清除此 BitSet 中所有的位,set - 用来屏蔽此 BitSet 的 BitSet
public int size(): 返回此 BitSet 表示位值时实际使用空间的位数。
public int length() 返回此 BitSet 的“逻辑大小”：BitSet 中最高设置位的索引加 1。 
public int hashCode(): 返回该集合Hash 码， 这个码同集合中的字位值有关。 
public boolean equals(Object other): 如果other中的字位同集合中的字位相同，返回true。 
public Object clone() 克隆此 BitSet，生成一个与之相等的新 BitSet。 
public String toString() 返回此位 set 的字符串表示形式。
```
## Demo




### 参考资料
[BitSet的使用场景及简单示例](https://my.oschina.net/cloudcoder/blog/294810)