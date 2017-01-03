# Groovy for Domain-Specific Languages

### Closures as method parameters

Groovy has a special handling for methods whose last parameter is a closure. When invoking these methods, the closure can be de ned anonymously after the method call parenthesis.

```
flintstones.each() { println "hello, ${it}" }


def flintstones = ["Fred","Barney", "Wilma"]println flintstones.findIndexOf(0) { it == "Wilma" }
     
```

备注：java.util.ArrayList.findIndexOf() is applicable for argument types: (java.lang.Integer) values: [0]
Possible solutions: findIndexOf(groovy.lang.Closure), findIndexOf(int, groovy.lang.Closure), indexOf(java.lang.Object), lastIndexOf(java.lang.Object), indexOf(java.lang.Object), lastIndexOf(java.lang.Object)


### What is a closure

1. Closures are anonymous. A closure is just a snippet of code that can be assigned to a variable and executed later
2. All closures are a sub class of type groovy.lang.Closure. Because groovy.lang is automatically imported, we can refer to Closure as a type within our code.
3. For each closure that is declared in our code, Groovy generates a Closure class for us, which is a subclass of groovy.lang.Closure. Our closure object is an instance of this class. Although we cannot predict what exact type of closure is generated, we can rely on it being a subtype of groovy.lang.Closure.