# Mixin

### @Mixin
The @Mixin annotation adds the methods of the class provided as an argument to the annotated class

### mixin method

we called the mixin() method on the class and passed it the name of the class we’d like to mix in.

```

class Friend { def listen() {"$name is listening as a friend" }}class Dog { String name}Dog.mixin Friendbuddy = new Dog(name: "Buddy") println buddy.listen()


socks = new Cat(name: "Socks") socks.metaClass.mixin Friend println socks.listen()

```