# Groovy环境配置

[在java项目的Maven工程里使用groovy](http://akunamotata.iteye.com/blog/1553416)

```
	你可以将groovy文件放在src/main/java和src/test/java目录下，这是不需要额外配置的最简易办法。但是，这不符合 maven的约定，建议将groovy文件放在src/main/groovy和src/test/groovy目录下。
   需要注意的是，至少有一个文件在src/main/java目录下（不管是不是java文件），这样所有的src/main/groovy目录下的文件会被 找到。如果src/main/java目录是空目录，那么所有的src/main/groovy目录下的文件将被忽略掉。为了识别src/main /groovy目录下的文件，你可以放一个空文件放在src/main/java目录下。同样的情况适用于src/test/java和src/test /groovy。
 
```