# Spring Tips

[spring的annotation注解之@Resource](http://blog.csdn.net/kiss_vicente/article/details/6900126)

	@Resource（JSR-250标准注解，推荐使用它来代替Spring专有的@Autowired注解） 
	Spring 不但支持自己定义的@Autowired注解，还支持几个由JSR-250规范定义的注解，它们分别是@Resource、@PostConstruct以及@PreDestroy。 
	@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按byName自动注入罢了。@Resource有两个属性是比较重要的，分别是name和type，Spring将@Resource注解的name属性解析为bean的名字，而type属性则解析为bean的类型。所以如果使用name属性，则使用byName的自动注入策略，而使用type属性时则使用byType自动注入策略。如果既不指定name也不指定type属性，这时将通过反射机制使用byName自动注入策略。 
	  @Resource装配顺序
	如果同时指定了name和type，则从Spring上下文中找到唯一匹配的bean进行装配，找不到则抛出异常
	如果指定了name，则从上下文中查找名称（id）匹配的bean进行装配，找不到则抛出异常
	如果指定了type，则从上下文中找到类型匹配的唯一bean进行装配，找不到或者找到多个，都会抛出异常
	如果既没有指定name，又没有指定type，则自动按照byName方式进行装配（见2）；如果没有匹配，则回退为一个原始类型（UserDao）进行匹配，如果匹配则自动装配；

[Spring中注入List，Set，Map,Properties](http://www.cnblogs.com/rollenholt/archive/2012/12/27/2835122.html)


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