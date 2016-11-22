# 开发一个Maven插件

*同学们，纠正一个错误的方法有很多，而解决一个错误的终极方法 就是不给它任何发生的机会。*

### 简单介绍Maven的生命周期

Maven有三套相互独立的生命周期，分别是clean、default和site。每个生命周期包含一些阶段（phase），阶段是有顺序的，后面的阶段依赖于前面的阶段。

1、clean生命周期：清理项目，包含三个phase。

1. pre-clean：执行清理前需要完成的工作
2. clean：清理上一次构建生成的文件
3. post-clean：执行清理后需要完成的工作

2、default生命周期：构建项目，重要的phase如下。

1. validate：验证工程是否正确，所有需要的资源是否可用。
2. compile：编译项目的源代码。  
3. test：使用合适的单元测试框架来测试已编译的源代码。这些测试不需要已打包和布署。
4. Package：把已编译的代码打包成可发布的格式，比如jar。
5. integration-test：如有需要，将包处理和发布到一个能够进行集成测试的环境。
6. verify：运行所有检查，验证包是否有效且达到质量标准。
7. install：把包安装到maven本地仓库，可以被其他工程作为依赖来使用。
8. Deploy：在集成或者发布环境下执行，将最终版本的包拷贝到远程的repository，使得其他的开发者或者工程可以共享。****

3、site生命周期：建立和发布项目站点，phase如下

1. pre-site：生成项目站点之前需要完成的工作
2. site：生成项目站点文档
3. post-site：生成项目站点之后需要完成的工作
4. site-deploy：将项目站点发布到服务器


### Maven插件开发的工程结构
Maven插件的工程结构和普通的java项目基本一致。需要特殊处理的有以下几个地方

1.在项目的pom.xml的<build>中要加入maven-plugin-plugin这个插件


```
<build>
	...
	
	 <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-plugin-plugin</artifactId>
            <version>3.0</version>
            <executions>
            </executions>
            <configuration>
                <!-- Needed for Java 5 annotation based configuration, for some reason. -->
                <skipErrorNoDescriptorsFound>true</skipErrorNoDescriptorsFound>
            </configuration>
        </plugin>
	...
	
</build>
	
```


2.引入开发maven插件所需的jar包
有两个jar包需要import，maven-plugin-api是开发maven插件的所需的基础/核心对象例如project、resource、artifact等等。maven-plugin-annotations顾名思义就是开发maven插件所需使用的annotation

 ```
 
<dependency>
	<groupId>org.apache.maven</groupId>
	<artifactId>maven-plugin-api</artifactId>
   <version>3.0.5</version>
</dependency>
<dependency>
    <groupId>org.apache.maven.plugin-tools</groupId>
    <artifactId>maven-plugin-annotations</artifactId>
    <version>3.4</version>
    <scope>provided</scope>
</dependency>
  
 ```      



### Maven插件Example-onebox XML规则校验
我们完成一个onebox的插件，这个插件主要检查我们的项目的工程文件和结构是不是符合onebox部署的规范，把不符合onebox部署规范的配置、资源文件在编译打包阶段发现，而不是等到正式发布以后，再发现问题。目前这个插件有以下几个功能
1. 检查dubbo的端口不是hardcode，也就是说dubbo必须通过aone的配置项管理
2. 检查dubbo的服务Bean和消费者Bean的版本号不是hardcode的，也就是说dubbo必须通过aone的配置项管理
3. 检查hsf的HSFSpringConsumerBean的version子元素的value值或子属性的值不是hardcode的
4. 检查hsf的HSFSpringProviderBean的serviceVersion子元素的value属性不是hardcode的

下面是这个插件的核心代码是用groovy写的，基本跟java也差不多，只是在用groovy处理xml的解析的时候

```


/**
 * Created by huweijun on 16/10/14.
 *
 * 运行onebox的xml文件的规则校验
 */
@Mojo(name = "xmlverify" ,defaultPhase = LifecyclePhase.VERIFY)
//Mojo这个Annotation 标志了这个插件的名称是xmlverify 管理的生命周期是verify maven的生命周期可以参考 http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

@Mojo(name = "xmlverify" ,defaultPhase = LifecyclePhase.VERIFY)
//AbstractMojo是由maven-plugin-api提供的类，maven插件用这个类做基类
public class XmlVerify extends AbstractMojo {

    //接受一个maven的插件的配置参数，参数名level。 缺省level值是warn，表示有错误只是log输出但不中断maven的编译
    @Parameter(property="level")
    String level="warn";

    private boolean errored;

    private Log log = getLog();

    //maven会注入项目的resouce 路径，例如main/resources
    @Parameter(defaultValue = '${project.build.resources}', readonly = true)
    List<Resource> resources;


//    MojoExecutionException: Maven执行目标遇到该异常会显示 BUILD FAILURE 错误信息, 表示在运行期间发生了预期的错误;
//    MojoFailureException: 表示运行期间遇到了未预期的错误, 显示 BUILD ERROR 信息.
    public void execute() throws MojoExecutionException, MojoFailureException {

        log.info("xmlverify is executed,leven=")

        if (resources == null) {
            log.warn("resource is null");
        }

        if(resources.isEmpty()){
            log.info("There is not build resource is found!")
            return
        }

        def resourceFiles=[];

        //把资源目录下的文件都找出来
        resources.each{
            def dir = new File(it.directory)
            if(!dir.exists()){
                return;
            }
            log.info(it.directory+" is collected");
            def files = FileUtils.listFiles(dir,null,true)
            resourceFiles.addAll(files);

        }


        //循环每个资源文件
        resourceFiles.each { resource->
            //只对xml进行处理
            if (!isXml(resource)) {
                return //continue;
            }


            try {
                //获取文件的内容，resource的类型是File ,text是groovy对java File类型的语法增强，可以快速的读取文件的内容，一般的java
                // 需要通过inputstream来实现
                String text = resource.text;
                //XMLParser是groovy内置的xml处理类
                def parser = new XmlParser(false, false, true)
                parser.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd",false)
                parser.setFeature("http://xml.org/sax/features/namespaces", false)
                def payload = parser.parseText(text)
                log.info("begin verify "+resource);
                //"dubbo:protocol" 这样可以方便的查找xml里面的内容，是不是很方便
                payload."dubbo:protocol".each{ it ->
                   // it.version 就是 dubbo:protocol这个元素的port属性,检查这个属性的值是不是用的${???} 这个的占位符表示的。
                   // ==~ 这个是groovy的正则表达式验证
                   if(! it.port==~ /\$\{\S+\}/){
                       errored=true;
                       log.error("${it} verified failed")
                   }else{
                       log.info("${it} varified passed")
                   }

                }
                //检查dubbo:service的version
                payload."dubbo:service".each{ it->
                    if(!it.version ==~/\$\{\S+\}/ ){
                        errored=true;
                        log.error("${it} verified failed")
                    }else{
                        log.info("${it} varified passed")
                    }

                }

                //检查dubbo:reference的version
                payload."dubbo:reference".each{ it->
                    if(!it.version ==~/\$\{\S+\}/ ){
                        errored=true;
                        log.error("${it} verified failed")
                    }else{
                        log.info("${it} varified passed")
                    }

                }

                //检查HSFSpringProviderBean的 serviceVersio
                payload.bean.property.each{ it->
                    if(it.@name=="serviceVersion" ) {
//                        log.info("${it.@value}")
                        if(it.parent().@class=='com.taobao.hsf.app.spring.util.HSFSpringProviderBean' && !(it.@value ==~/\$\{\S+\}/) ) {
                            errored = true;
                            log.error("${it} HSFSpringProviderBean verified failed")
                        }
                    }


                }

                //检查HSFSpringConsumerBean的version
                payload.bean.property.each{ it->
                    if(it.@name=="version") {
                        if(it.parent().@class=='com.taobao.hsf.app.spring.util.HSFSpringConsumerBean' && ( it.@value && !( it.@value ==~/\$\{\S+\}/) || it.value.text&& !( it.value.text ==~/\$\{\S+\}/)) ) {
                            errored = true;
                            log.error("${it} HSFSpringConsumerBean verified failed")
                        }
                    }


                }

            } catch (Exception ex) {
                throw new MojoExecutionException(resource.getPath() + " is illegal xml file", ex);
            }

        }

        if(errored && isErrorLevel()){
                throw  new MojoExecutionException("executed failed");
        }


    }

   private boolean isErrorLevel(){
       return StringUtils.equalsIgnoreCase(level,"error");
   }
    private boolean isXml(File file) {
        String fileName=file.name;
        return StringUtils.endsWithIgnoreCase(fileName, "xml") || StringUtils.endsWithIgnoreCase(fileName, "xml.vm");
    }

}

```


### maven插件的使用
对于要使用这个插件的项目，就在pom中对这个插件进行引用

```
<build>
	...
	 <plugin>
        <groupId>com.aliyun.cloud.yunying.maven.plugins</groupId>
        <artifactId>onebox-plugin</artifactId>
        <version>1.0-SNAPSHOT</version>
        <configuration>
       	  <!--error 会中断maven打包，warn只是检查不符合的配置项，不会中断maven打包-->
            <level>warn</level>
        </configuration>
        <executions>
            <execution>

                <goals>
                    <goal>xmlverify</goal>
                </goals>
                <phase>validate</phase>
            </execution>
        </executions>
    </plugin>	
   ...
</build>

```


 
### maven插件的发布
maven插件的发布跟普通的maven项目发布没有区别 

```
mvn clean install deploy  -DskipTests=true
可以把snapshot的版本的maven插件发布到仓库
```





  
 