# Spock 测试框架

[Spock Web Console]("http://meetspock.appspot.com/")

[Spock Example]("https://github.com/spockframework/spock-example")

[Spock 文档]("http://spockframework.github.io/spock/docs/1.0/")

[Spock Primer]("http://spockframework.github.io/spock/docs/1.0/spock_primer.html")

	Fields:Objects stored into instance fields are not shared between feature methods. Instead, every feature method gets its own object. This helps to isolate feature methods from each other, which is often a desirable goal. Sometimes you need to share an object between feature methods. For example, the object might be very expensive to create, or you might want your feature methods to interact with each other. To achieve this, declare a @Shared field. 

	Fixture Methods：
	def setup() {}          // run before every feature method
	def cleanup() {}        // run after every feature method
	def	setupSpec() {}     // run before the first feature method
	def cleanupSpec() {}   // run after the last feature method
	
	Blocks：Blocks start with a label, and extend to the beginning of the next block, or the end of the method. There are six kinds of blocks: setup, when, then, expect, cleanup, and where blocks. Any statements between the beginning of the method and the first explicit block belong to an implicit setup block.
	![BLOCK](http://spockframework.github.io/spock/docs/1.0/images/Blocks2Phases.png)

[使用Spock框架进行单元测试]("http://www.open-open.com/lib/view/open1439793373083.html")

[用 Spock 简化 Mock]("http://my.oschina.net/lifany/blog/144985?fromerr=o9Q0QltU")