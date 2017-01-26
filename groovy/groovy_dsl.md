# Groovy DSL

### Creating DSLs in Groovy
A DSL is small, simple (it may not be simple to design, though), expressive, and focused on a problem area or domain. DSLs have two characteristics: they’re context-driven and fluent.


Groovy has a number of key capabilities to help create internal DSLs, including the following:

3.  Open classes, thanks to categories and ExpandoMetaClass 
4.  Closures that provide a nice context for execution 
6.  Builder support



```

move forward and then turn left


def (forward, left, then, fast, right) = ['forward', 'left', '', 'fast', 'right']

```


### Categories and DSLs

```
class DateUtil {



```

### ExpandoMetaClass and DSLs


```
Integer.metaClass{ getDays = { ->

```

### 参考
[Gradle学习系列之三——读懂Gradle语法](http://www.cnblogs.com/CloudTeng/p/3418072.html)

	另外，Gradle大量地使用了Groovy闭包的delegate机制。简单来说，delegate机制可以使我们将一个闭包中的执行代码的作用对象设置成任意其他对象。
	
```


class Child {
   private String name
}

class Parent {
   Child child = new Child();

   void configChild(Closure c) {
      c.delegate = child
      c.setResolveStrategy Closure.DELEGATE_FIRST
      c()
   }
}

def parent = new Parent()
parent.configChild {
name = "child name"
}

println parent.child.name


```	


