# Groovy处理Java Bean

### Getter and Setter

1. 在Groovy中，类无访问修饰符则被认为是public；而属性无访问修饰符则认为是private。方法无访问修饰符则认为是public。 


### Groovy的named parameter

Groovy的named parameter 一般有两个用途：

1. 用在groovybean的构造函数中，提供一种便利的方式来创建新对象。例如：def p =new Person([name:'yezi',age:25])   
2. 用在方法中(static or not-static)，如果传入的参数是named parameter的话，那么该方法会自动收集这些named parameter，然后当成该方法的第一个参数，关键是不理会named paramter的位置。




### 隐式构造函数

```

class Addr{  
    String homeAddr  
    String workAddr  
      
    Addr(def home,def office)  
    {  
        this.homeAddr=home  
        this.workAddr=office  
    }  
}  



```


那么创建Addr对象将有如下几种方式：

1. 显示调用构造函数Addr(def home,def office)
2. 显示使用as来调用对应的构造函数 :def addr=["home","office"] as Addr
3. 隐式的让groovy通过类型推断来调用对应的构造函数 Addr </strong>addr=["home","office"]  


对于第2种第3种方式，groovy bean需要显示提供对应的构造函数定义。

