# Spring Tips

[spring RestTemplate用法详解]("http://blog.csdn.net/wwwihpccn/article/details/30496089")

[Concurrency – Executors and Spring Integration]("http://www.javacodegeeks.com/
2012/06/concurrency-executors-and-spring.html")

[spring @component的作用]("http://tomfish88.iteye.com/blog/1497557")

1. @controller 控制器（注入服务）
2. @service 服务（注入dao）
2. @repository dao（实现dao访问）
2. @component （把普通pojo实例化到spring容器中，相当于配置文件中的<bean id="" class=""/>）

[spring 中的<aop:advisor>和<aop:aspect>有什么区别]("http://www.iteye.com/problems/69785")


	1.Adivisor是一种特殊的Aspect，Advisor代表spring中的Aspect 
	2、区别：advisor只持有一个Pointcut和一个advice，而aspect可以多个pointcut和多个advice

[How to inject null value in Spring]("http://www.mkyong.com/spring/how-to-inject-null-value-in-spring/")


    <bean id="defaultMongoTypeMapper"
	class="org.springframework.data.mongodb.core.convert.DefaultMongoTypeMapper">
	<constructor-arg name="typeKey">
		<null />
	</constructor-arg>
	  </bean>
	  
	  
	  
[Spring 依赖注入：自动注入properties文件中的配置]("http://outofmemory.cn/code-snippet/3700/spring-bean-property-inject")

	自动注入需要使用@Value注解，这个注解的格式#{configProperties['mysql.url']}其中configProperties是我们在appContext.xml中配置的beanId，mysql.url是在properties文件中的配置项。
	
	
[Spring3中用注解直接注入properties中的值]("http://sunjun041640.blog.163.com/blog/static/256268322013112325324373/")
	
	@Value("${sytem.username}")