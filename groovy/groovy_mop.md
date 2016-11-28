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