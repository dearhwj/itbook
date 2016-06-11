#  lombok的使用和原理


### 常用的 lombok 注解
[Lombok features](https://projectlombok.org/features/index.html)

1. @Data   ：注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法
2. @Setter：注解在属性上；为属性提供 setting 方法
3. @Getter：注解在属性上；为属性提供 getting 方法
4. @Log4j ：注解在类上；为类提供一个 属性名为log 的 log4j 日志对象
5. @Slf4j: Creates private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(LogExample.class);
5. @NoArgsConstructor：注解在类上；为类提供一个无参的构造方法
6. @AllArgsConstructor：注解在类上；为类提供一个全参的构造方法




### 参考
[ lombok的使用和原理](http://blog.csdn.net/dslztx/article/details/46715803)