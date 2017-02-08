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


### Calling closures
1. Using the unnamed ()
2. By calling the call()
3. By calling the doCall() 


### Closure Parameters

1. The parameter list is a comma-separated list of parameter names with optional type de nitions. Closures behave slightly different depending on whether we supply the optional type.
2. For a closure with no explicit parameter de ned, we can expect a doCall that accepts varargs to be generated.
3. For a closure accepting only one dynamically-typed parameter, we would expect our doCall to also accept a single parameter.
4. A closure that accepts typed parameters will have a doCall method that accepts only the same speci c types as the closure parameters to be generated.
5. To accept multiple parameters, we list the parameters in order before the -> symbol.
6. We can de ne default parameters by supplying a value in the parameter list, as follows:


### curry
在调用 curry() 方法时，不需要提供所有的实际参数。curry 过的 调用只引起了闭包的部分应用程序。闭包的 部分应用程序 是另一个 Closure 对象，在这个对象中有些值已经被修正。

```
def multiply = { x, y -> return x * y }  // closure
def triple = multiply.curry(3)           // triple = { y -> return 3 * y }
def quadruple = multiply.curry(4) 
// quadruple = { y -> return 4 * y }
def p = triple.call(4)                   // explicit call
def q = quadruple(5)                     // implicit call
println "p: ${p}"                        // p is 12
println "q: ${q}"                        // q is 20
```

### Closure return values
A closure can have explicit return statements. If a return statement is encountered, then the value de ned in the return statement is returned; If no return statement is encountered, then the value returned by the closure is the result of evaluating the last statement encountered in the closure block


### Adding a command-line interface

```
#!/usr/bin/env groovyString.metaClass.search = { Closure c ->     GeeTwitter.search(delegate, c)}if (args)    evaluate(new File(args[0]))else    println "Usage: GeeTwitter <script>"
            
```

The evaluate method in Groovy allows us to pass a  le containing Groovy code to the Groovy interpreter. Any code contained within the  le is compiled and executed within the same virtual machine as the one where we are running the loading script. When the above script is executed from the command, the groovy command is invoked by the shell, which in turn launches a JVM. The evaluate method causes the target script to be loaded and executed in the same environment, and everything else works as if by magic.



