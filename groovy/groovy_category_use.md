# Category和use块

```

class MetaTest extends GroovyTestCase{
  void testCategory(){
    String message = "Hello"
    use(StringHelper){
      assertEquals "HELLO", message.shout()
      assertEquals "GOODBYE", "goodbye".shout()
    }

    shouldFail{
      message.shout()
      "foo".shout()
    }
  }
}

class StringHelper{
  static String shout(String self){
    return self.toUpperCase()
  }
}


```

如果曾经从事过 Objective-C 开发，那么应当对这个技巧感到熟悉。StringHelperCategory 是一个普通类 — 它不需要扩展特定的父类或实现特殊的接口。要向类型为 T 的特定类添加新方法，只需定义一个静态方法，它接受类型 T 作为第一个参数。由于 shout() 是一个接受 String 作为第一个参数的静态方法，因此所有封装到 use 块中的 String 都获得了一个 shout() 方法。


那么，什么时候应该选择 Category 而不是 EMC？EMC 允许您将方法添加到某个类的单一实例或所有实例中。可以看到，定义 Category 允许您将方法添加到特定 实例中 — 只限于 use 块内部的实例。
虽然 EMC 允许您动态定义新行为，然而 Category 允许您将行为保存到独立的类文件中。这意味着您可以在不同的情况下使用它：单元测试、生产代码，等等。定义单独类的开销在重用性方面获得了回报。


### @Category

Groovy  provides an alternative syntax for categories. Rather than writing static methods, we can ask the Groovy compiler to convert instance methods of a class to static methods with the format discussed previously. We can do this using a special @Category annotation. We can implement the StringUtil using this annotation, like this:```@Category(String)class StringUtilAnnotated {def toSSN() {if (size() == 9) {"${this[0..2]}-${this[3..4]}-${this[5..8]}" }} }use(StringUtilAnnotated) { println "123456789".toSSN()}```