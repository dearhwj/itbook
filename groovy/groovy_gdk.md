# Groovy的GDK扩展

### dump方法


###  insepect方法


### with关键字

```
lst = [1, 2]lst.with {  add(3)  add(4)  println size()  println contains(2)}

```


### sleep方法


### 直接访问属性

```

car = new Car(fuelLevel: 80, miles: 25)properties = ['miles', 'fuelLevel']// the above list may be populated from some input or // may come from a dynamic form in a web appproperties.each { name -> println "$name = ${car[name]}"}



```


### 执行调用方法

```

peter = new Person()peter.invokeMethod("walk", null) peter.invokeMethod("walk", 10)
peter.invokeMethod("walk", [2, 'uphill'] as Object[])```


### java.lang Extensions

1. Numbr增加了upto和downto方法



### java.io Extensions

1. File 增加了eachFile &  eachDir & eachLine & filterLine
2. BufferedReader & InputStream & File 增加了text属性



### java.util Extensions

1. List, Set, SortedMap,  SortedSet 增加了asImmutable & asSynchronized
2. Iterator 增加了inject
3. 

