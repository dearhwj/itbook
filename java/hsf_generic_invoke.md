# HSF泛化调用

简单的理解，泛化调用就是不依赖二方包，通过传入 方法名，方法签名 和 参数值，就可以调用服务。跟之前HSF提供的TOP方式很类似，但有些许的不同。

如果客户端没有接口类，路由规则默认不生效

与TOP调用的区别：

TOP调用需要服务端配置下TOP实现的 transformer 来转化参数，而泛化调用不需要。TOP调用文档：HSF TOP调用
注意事项

1. 方法名、参数类型、参数值的表达

方法名和参数类型用字符串表示是很直接的，但是 参数值 可能会复杂些：

诸如 Number, String, Date 这些会简单点
直接依赖二方包的 POJO Bean 的表达需要一些限制：
这些参数 POJO 需要提供默认 构造函数和成员变量的 getters setters
使用 Map 表达一个参数POJO。
建议:

调用方在不确定格式的情况下，可以写个单元测试，测试时依赖需要泛化调用的二方包，使用HSF提供的工具类 com.taobao.hsf.util.PojoUtils 的 generalize() 方法来生成一个 POJO Bean 的字符串描述格式。
2. 版本要求

在HSF内部，泛化调用的支持主要实现在服务端，服务端在接受泛化请求时会把对应的方法，方法参数和参数值构造成对应 Method 的值，所以要使用泛化功能，服务端必须升级到 HSF 2.x 及其以上的版本。

3. 泛化调用单元化服务

需要使用com.taobao.hsf.util.RequestCtxUtil#setUserId设置userId

使用方法

1. Spring 配置的方式

配置 generic 属性为ture， 如下所示：

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">

  <bean id="helloWorldService" class="com.taobao.hsf.app.spring.util.HSFSpringConsumerBean"  init-method="init">
    <property name="interfaceName">
      <value>com.taobao.hsf.jar.test.HelloWorldService</value>
    </property>
    <property name="version">
      <value>1.0.0.kongming</value>
    </property>
    <!-- 配置 generic 为 true -->
    <property name="generic">
      <value>true</value>
    </property>
  </bean>
</beans>
具体调用时，如何使用 consumerBean，请参考下一范例。

```

2. 动态生成

Provider端范例

为了方便测试，这里提供一个Provider端的实现：

```
public class App {

    public static void main(String... args) throws Exception {
        HSFApiProviderBean providerBean = new HSFApiProviderBean();
        providerBean.setServiceInterface("com.alibaba.pfmiles.testhsf.TestHsfService");
        providerBean.setServiceVersion("1.0");
        providerBean.setTarget(new TestHsfServiceImpl());
        providerBean.init();
    }
}

```

Consumer端泛化调用范例

服务消费端 consumer 的泛化调用代码范例如下：

下面包含了传入各种参数的写法，感谢 miles123456 提供完整的测试程序，下载链接： 点击下载完整测试用例

```
/**
 * @author pf-miles 2013-12-13 下午2:42:56
 */
public class ConsumeApp {

    public static void main(String... args) {
        // 不一定要每次都new ，也不一定要直接依赖api使用HSF，Spring的Bean也可以使用泛化
        // 重点是强转接口转成GenericService
        HSFApiConsumerBean consumerBean = new HSFApiConsumerBean();
        consumerBean.setInterfaceName("com.alibaba.pfmiles.testhsf.TestHsfService");
        consumerBean.setGeneric("true"); // 设置 generic 为 true
        consumerBean.setVersion("1.0");

        try {
            consumerBean.init();
            GenericService svc = (GenericService) consumerBean.getObject(); // 强转接口接口为 GenericService

            // 传入基本类型，返回基本类型
            System.out.println(svc.$invoke("testRetPrimitive", new String[] { "long" }, new Object[] { 1l }));
            System.out.println(svc.$invoke("testRetPrimitive", new String[] { "long" }, new Object[] { 1l }));

            // 传入数组类型，返回数组类型
            System.out.println(svc.$invoke("testRetArray", new String[] { "[Ljava.lang.String;" },
                    new Object[] { new String[] { "haha", "hehe", "hoho" } }));

            // 传入map，返回map
            Map<String, String> map = new HashMap<String, String>();
            map.put("hello", "world");
            System.out.println(svc.$invoke("testRetMap", new String[] { "java.util.Map" }, new Object[] { map }));

            // 传入jdk内置类型对象，返回内置类型对象
            System.out.println(svc.$invoke("testRetObject", new String[] { Integer.class.getName() },
                    new Object[] { 7 }));

            // 传入业务自定义pojo，返回业务自定义pojo
            // 使用 PojoUtils 生成二方包pojo的描述，实际调用时，改步骤可以提前在测试程序中做掉，需要泛化调用的场景，直接使用测试程序中生成的描述代入
            ParamClass param = new ParamClass();
            param.setI(11);
            param.setName("Miles");
            Object comp = PojoUtils.generalize(param); 

           //直接使用map去构造
            Map param = new HashMap<String, Object>();
            param.put("i", 11);
            param.put("name","Miles");

            System.out.println(svc.$invoke("testRetPojo",
                    new String[] { "com.alibaba.pfmiles.testhsf.pojo.ParamClass" }, new Object[] { comp }));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```