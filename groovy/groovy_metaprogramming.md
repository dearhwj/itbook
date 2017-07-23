# Groovy Metaprogramming

原文[http://groovy-lang.org/metaprogramming.html](http://groovy-lang.org/metaprogramming.html)

* POJO - A regular Java object, whose class can be written in Java or any other language for the JVM.

* POGO - A Groovy object, whose class is written in Groovy. It extends java.lang.Object and implements the groovy.lang.GroovyObject interface by default.

* Groovy Interceptor - A Groovy object that implements the groovy.lang.GroovyInterceptable interface and has method-interception capability, which we’ll discuss in the GroovyInterceptable section.



1. get/setProperty：Every read access to a property can be intercepted by overriding the getProperty() method of the current object. You can intercept write access to properties by overriding the setProperty() method。
2. get/setMetaClass: You can a access an object’s metaClass or set your own MetaClass implementation for changing the default interception mechanism. 
3. get/setAttribute: This functionality is related to the MetaClass implementation. In the default implementation you can access fields without invoking their getters and setters. 
4.  invokeMethod: It is also invoked when the method called is not present on a Groovy object. 
5. Groovy supports the concept of methodMissing. This method differs from invokeMethod in that it is only invoked in the case of a failed method dispatch when no method can be found for the given name and/or the given arguments
6. propertyMissing: Groovy supports the concept of propertyMissing for intercepting otherwise failing property resolution attempts。The ***propertyMissing(String)*** method is only called when no getter method for the given property can be found by the Groovy runtime.  For setter methods a second ***propertyMissing(String name, value)*** definition can be added that takes an additional value argument 。 methodMissing and propertyMissing methods that deal with static methods and properties can be added via the ExpandoMetaClass.

![](http://docs.groovy-lang.org/latest/html/documentation/assets/img/GroovyInterceptions.png)