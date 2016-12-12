# Groovy元对象协议(Metaobject Protocol，MOP)

### Groovy Object
Groovy objects are Java objects with additional capabilities. Groovy objects have a greater number of dynamic behaviors than do compiled Java objects in Groovy. Also, Groovy handles method calls to Java objects differently than to Groovy objects.

```

public interface GroovyObject {

    Object invokeMethod(String name, Object args);

    Object getProperty(String propertyName);

    void setProperty(String propertyName, Object newValue);

    MetaClass getMetaClass();

    void setMetaClass(MetaClass metaClass);
}


```



### How Groovy handles method calls on a POGO

If the POGO does not implement GroovyInterceptable, then Groovy looks for the method first in the POGO’s MetaClass and then, if it’s not found, on the POGO itself. If the POGO has no such method, Groovy looks for a property or a field with the method name. If that property or field is of type Closure, Groovy invokes that in place of the method call. If Groovy finds no such property or field, it makes two last attempts. If the POGO has a method named methodMissing(), it calls it. Otherwise, it calls the POGO’s invokeMethod(). If we’ve implemented this method on our POGO, it’s used. The default implementation of invokeMethod() throws a MissingMethodException, indicating the failure of the call.



### Querying Methods and Properties
1. getStaticMetaMethod looking for a static method
2. getMetaMethod  get a metamethod
3. To get a list of overloaded methods, we use the plural forms of these methods—getMetaMethods() and getStaticMetaMethods()
4. we can use getMetaProperty() and getStaticMetaProperty() for a metaproperty
5. Method respondsTo find out whether an object would respond to a method cal

###  Dynamically Accessing Objects

```

def printInfo(obj) {// Assume user entered these values from standard input usrRequestedProperty = 'bytes'usrRequestedMethod = 'toUpperCase'        println obj[usrRequestedProperty]//orprintln obj."$usrRequestedProperty"println obj."$usrRequestedMethod"()//orprintln obj.invokeMethod(usrRequestedMethod, null)} 
printInfo('hello')

```
1. To invoke a property dynamically, we can use the index operator [] or use the dot notation followed by a GString evaluating the property name
2. To invoke a method, use the dot notation or call the invokeMethod on the object, giving it the method name and list of arguments
3. To iterate over all of an object’s properties, we can use the properties property


### Intercepting Methods Using MOP
1. Intercepting Methods Using MetaClass
2.  Intercepting Methods Using GroovyInterceptable### ExpandoMetaClass (EMC) DSL

Adding methods to the metaclass using the syntax ClassName.metaClass.method = {...} is simple and convenient if we want to add one or two methods. If we want to add a bunch of methods, the declaration and setup will soon feel like a burden. Groovy provides a way to group these methods into a convenient syntax called an ExpandoMetaClass (EMC) DSL.


```


Integer.metaClass { daysFromNow = { ->Calendar today = Calendar.instance today.add(Calendar.DAY_OF_MONTH, delegate) today.time}getDaysFromNow = { ->Calendar today = Calendar.instance today.add(Calendar.DAY_OF_MONTH, delegate) today.time}'static' {isEven = { val -> val % 2 == 0 }}constructor = { Calendar calendar ->new Integer(calendar.get(Calendar.DAY_OF_YEAR))}constructor = { int val ->println "Intercepting constructor call"constructor = Integer.class.getConstructor(Integer.TYPE) constructor.newInstance(val)} }


```


ExpandoMetaClass has some limitations, however. The injected methods are available only for calls within Groovy code.  We can’t use these methods from within compiled Java code. They can’t be used with reflection from Java code, either.


### Injecting Methods into Specific Instances

The MetaClass is per-instance. If we want an instance to have a different behavior than the other objects instantiated from the same class, we inject the methods into the metaClass obtained from the specific instance. Alternatively, we can create an instance of ExpandoMetaClass, add the desired methods to it (including the methods we’d like to preserve from the instance’s current metaClass), initialize it (required to indicate the completion of method/property additions), and attach it to the instance we desire to enhance.


### Injecting Methods Using Mixins

We can mix behavior into existing classes to inject methods into both Groovy and Java classes.


### Expando类

Expando对象就像一个Map对象一样，可以任意的增加键值对，然后存储起来。也像一个动态的GroovyBean对象，它可以不用预先设定任何的属性，一切都可以在使用的时候增加。它与Map对象的最大不同在于Expando对象除了可以在运行期增加属性以外，还可以动态的增加方法。


```
def person = new Expando()
     
      person.name = 'Alice'
     
      person.age = 18
     
      person.description = {
         println """
           ----------description---------
               name: ${person.name}
              age:  ${person.age}
           ------------------------------
         """
      }
     
      person.description()

```