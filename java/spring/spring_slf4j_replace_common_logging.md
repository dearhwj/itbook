#  Spring使用SLF4J代替Commons Logging写日志


排除掉commons-logging:commons-logging相关的包，如果有间接依赖，比如commons-beanutils：commons-beanutils也会间接依赖commons-logging:commons-logging，那就也需要排除间接依赖,例如

```
 <dependency>
    <groupId>commons-beanutils</groupId>
    <artifactId>commons-beanutils</artifactId>
    <version>1.8.3</version>
    <exclusions>

        <exclusion>
            <groupId>commons-logging</groupId>
            <artifactId>commons-logging</artifactId>
        </exclusion>
    </exclusions>
</dependency>
                
```    

由于commons-logging使用方很多，spring、apache的组件都会用到commons-logging，***切记一定要彻底排干净***
加入
```
<dependency>
        <groupId>org.slf4j</groupId>
        <artifactId>jcl-over-slf4j</artifactId>
        <version>1.7.9</version>
</dependency>

```









            