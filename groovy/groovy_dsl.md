# Groovy DSL

### Creating DSLs in Groovy
A DSL is small, simple (it may not be simple to design, though), expressive, and focused on a problem area or domain. DSLs have two characteristics: they’re context-driven and fluent.


Groovy has a number of key capabilities to help create internal DSLs, including the following:
1.  Dynamic and optional typing 2.  The flexibility to load scripts dynamically, plus manipulate and executethem 
3.  Open classes, thanks to categories and ExpandoMetaClass 
4.  Closures that provide a nice context for execution 5.  Operator overloading helps freely define operators 
6.  Builder support7. Flexible parentheses



```

move forward and then turn leftjump fast, forward and then turn right


def (forward, left, then, fast, right) = ['forward', 'left', '', 'fast', 'right']def move(dir) {		println "moving $dir" this}def and(then) { this }def turn(dir) {	println "turning $dir" this}def jump(speed, dir) {	println "jumping $speed and $dir" this}

```


### Categories and DSLs

```
class DateUtil {static int getDays(Integer self) { self }static Calendar getAgo(Integer self) { def date = Calendar.instance date.add(Calendar.DAY_OF_MONTH, -self) date}static Date at(Calendar self, Map time) {def hour = 0def minute = 0time.each {key, value -> hour = key.toInteger()      minute = value.toInteger()    }self.set(Calendar.HOUR_OF_DAY, hour) self.set(Calendar.MINUTE, minute) self.set(Calendar.SECOND, 0) self.time} }use(DateUtil) {  println 2.days.ago.at(4:30)}



```

### ExpandoMetaClass and DSLs


```
Integer.metaClass{ getDays = { ->delegate }getAgo = { ->def date = Calendar.instance date.add(Calendar.DAY_OF_MONTH, -delegate) date} }Calendar.metaClass.at = { Map time -> def hour = 0def minute = 0time.each {key, value ->            hour = key.toInteger()            minute = value.toInteger()          }delegate.set(Calendar.HOUR_OF_DAY, hour) delegate.set(Calendar.MINUTE, minute) delegate.set(Calendar.SECOND, 0) delegate.time}      println 2.days.ago.at(4:30)

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



