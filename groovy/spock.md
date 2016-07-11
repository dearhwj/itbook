# 使用Spock框架进行单元测试

简单地说，spock是一个测试框架，它的核心特性有以下几个：

1. 可以应用于java或groovy应用的单元测试框架。
2. 测试代码使用基于groovy语言扩展而成的规范说明语言（specification language）。
3. 通过junit runner调用测试，兼容绝大部分junit的运行场景（ide，构建工具，持续集成等）。
4. 框架的设计思路参考了JUnit，jMock，RSpec，Groovy，Scala，Vulcans……


看一个spock的case

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/spock_example.png)

这个语法还是很流畅的，再来看一个spock的特性。

![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/spock_example2.png)


这个是运行测试用例以后，测试失败控制台的输出，哪里出错一目了然呀。 
spock主要的学习资料都在后面的参考里面列着，熟悉了java的单元测试以后，很容易掌握理解spock的这些概念。学习成本也不高，在掌握了groovy的语法以后，大概通过4-5个小时的就能用起来。
最后，说说我为啥用spock来写单元，主要的原因是：spock能做的事情，java单元测试都能做，唯一的差别就是开发效率，开发效率能提升多少，大家看看写同样的单元测试，需要输入量就知道了。

我现在的开发模式是：
1. 用idea+IdeaVim，优化开发工具
2. 用groovy+spock来写单元测试，让编写单元测试的效率提升。


###  配置gmavenplus插件运行单元/集成测试
groovy的单元/集成测试需要先利用gmavenplus插件，把groovy编译成相应的java class文件，然后surefire就可以运行相应的单元测试了

``` 
 <build>
        <plugins>
<plugin>
                <!-- The gmavenplus plugin is used to compile Groovy code. To learn more about this plugin,
                visit https://github.com/groovy/GMavenPlus/wiki -->
                <groupId>org.codehaus.gmavenplus</groupId>
                <artifactId>gmavenplus-plugin</artifactId>
                <version>1.5</version>
                <configuration>
                    <testSources>
                        <testSource>
                            <directory>${project.basedir}/src/test/groovy</directory>
                            <includes>
                               <include>**/*.groovy</include>
                            </includes>
                        </testSource>
                    </testSources>
                </configuration>
                <dependencies>
                    <dependency>
                        <groupId>org.codehaus.groovy</groupId>
                        <artifactId>groovy-all</artifactId>
                        <!-- any version of Groovy \>= 1.5.0 should work here -->
                        <version>2.4.1</version>
                        <scope>runtime</scope>
                    </dependency>
                </dependencies>
                <executions>
                    <execution>
                        <goals>
                            <goal>testCompile</goal>
                            <goal>compile</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
</plugins>
  </build>
```		

### IntelliJ的Groovy插件
IntelliJ idea 默认不能很好的处理groovy的代码路径(src/main/groovy、src/test/groovy)。GMavenPlus IntelliJ Plugin这个插件会把src/main/groovy and src/test/groovy加入到IntelliJ工程的构建路径中






###参考

[Spock Web Console](http://meetspock.appspot.com/)

[Spock Example](https://github.com/spockframework/spock-example)

[Spock 文档](http://spockframework.github.io/spock/docs/1.0/)

[Spock Primer](http://spockframework.github.io/spock/docs/1.0/spock_primer.html)

	Fields:Objects stored into instance fields are not shared between feature methods. Instead, every feature method gets its own object. This helps to isolate feature methods from each other, which is often a desirable goal. Sometimes you need to share an object between feature methods. For example, the object might be very expensive to create, or you might want your feature methods to interact with each other. To achieve this, declare a @Shared field. 

	Fixture Methods：
	def setup() {}          // run before every feature method
	def cleanup() {}        // run after every feature method
	def	setupSpec() {}     // run before the first feature method
	def cleanupSpec() {}   // run after the last feature method
	
	Blocks：Blocks start with a label, and extend to the beginning of the next block, or the end of the method. There are six kinds of blocks: setup, when, then, expect, cleanup, and where blocks. Any statements between the beginning of the method and the first explicit block belong to an implicit setup block.
	![BLOCK](http://spockframework.github.io/spock/docs/1.0/images/Blocks2Phases.png)

[使用Spock框架进行单元测试](http://www.open-open.com/lib/view/open1439793373083.html)

[用 Spock 简化 Mock](http://my.oschina.net/lifany/blog/144985?fromerr=o9Q0QltU)