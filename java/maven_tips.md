# Maven Tips

### Reference

[Maven: The Complete Reference](http://books.sonatype.com/mvnref-book/reference/) 

### Maven的生命周期
[Maven 构建生命周期](http://www.yiibai.com/maven/maven_build_life_cycle.html)
	
	Maven有以下三种标准的生命周期：clean、default(或 build)、site
	这是 Maven 主要的生命周期，用于构建应用程序。它有以下 23 个阶段。
	validate	验证项目是否正确，并且所有必要的信息可用于完成构建过程
	initialize	建立初始化状态，例如设置属性
	generate-sources	产生任何的源代码包含在编译阶段
	process-sources	处理源代码，例如，过滤器值
	generate-resources	包含在包中产生的资源
	process-resources	复制和处理资源到目标目录，准备打包阶段
	compile	编译该项目的源代码
	process-classes	从编译生成的文件提交处理，例如：Java类的字节码增强/优化
	generate-test-sources	生成任何测试的源代码包含在编译阶段
	process-test-sources	处理测试源代码，例如，过滤器任何值
	test-compile	编译测试源代码到测试目标目录
	process-test-classes	处理测试代码文件编译生成的文件
	test	运行测试使用合适的单元测试框架（JUnit）
	prepare-package	执行必要的任何操作的实际打包之前准备一个包
	package	提取编译后的代码，并在其分发格式打包，如JAR，WAR或EAR文件
	pre-integration-test	完成执行集成测试之前所需操作。例如，设置所需的环境
	integration-test	处理并在必要时部署软件包到集成测试可以运行的环境
	pre-integration-test	完成集成测试已全部执行后所需操作。例如，清理环境
	verify	运行任何检查，验证包是有效的，符合质量审核规定
	install	将包安装到本地存储库，它可以用作当地其他项目的依赖
	7
	deploy	复制最终的包到远程仓库与其他开发者和项目共享	


### Maven的预定义变量
[List of predefined Maven properties](https://github.com/cko/predefined_maven_properties/blob/master/README.md)
	
	${basedir} represents the directory containing pom.xml
	${version} equivalent to ${project.version} (deprecated: ${pom.version})
	All elements in the pom.xml, can be referenced with the project. prefix. This list is just an example of some commonly used elements. (deprecated: ${pom.} prefix)
	${project.build.directory} results in the path to your "target" directory, this is the same as ${pom.project.build.directory}
	${project.build.outputDirectory} results in the path to your "target/classes" directory
	${project.name} refers to the name of the project (deprecated: ${pom.name} ).
	${project.version} refers to the version of the project (deprecated: ${pom.version}).
	${project.build.finalName} refers to the final name of the file created when the built project is packaged
	
	Similarly, values in the user's settings.xml can be referenced using property names with settings. prefix. ${settings.localRepository} refers to the path of the user's local repository
	
	Environment variables can be referenced using the env prefix
	${env.M2_HOME} returns the Maven2 installation path.
	${java.home} specifies the path to the current JRE_HOME environment use with relative paths to get for example: <jvm>${java.home}../bin/java.exe</jvm>
	
	All Java System Properties defined by the JVM: ${file.separator}
	${java.class.path}
	${java.home}
	${java.vendor}
	${java.vendor.url}
	${java.version}
	${line.separator}
	${os.arch}
	${os.name}
	${os.version}
	${path.separator}
	${user.dir}
	${user.home}
	${user.name}

	User defined properties in the pom.xml.
	<project>
	...
	  <properties>
    	 <my.filter.value>hello</my.filter.value>
	  </properties>
	...
	</project>
	${my.filter.value} will result in hello if you inserted the above XML fragment in your pom.xml


### 插件机制
[Maven 插件机制](http://www.tuicool.com/articles/ry2qAbb)


### Plugin
[Maven Failsafe Plugin](http://maven.apache.org/surefire/maven-failsafe-plugin/)


[Maven插件之build-helper-maven-plugin](http://blog.csdn.net/wangjunjun2008/article/details/17553503)

	把原有项目添加到Maven管理时，总会出现很多莫名奇妙的问题，其中之一便是Maven默认的项目结构和自己的项目结构不一致，导致无法编译源代码，更不用说部署、运行项目了。Java程序开发，一般使用Eclipse、MyEclipse等工具，其源码目录为src，这与Maven默认的src/main/java不同。因此，在没有额外配置的情况下，使用Maven命令无法完成代码的编译。针对这种情况，codehaus提供了build-helper-maven-plugin插件来支持自定义的项目目录结构(相对于Maven默认目录结构来说)。

[Maven Help插件的使用]("http://blog.csdn.net/zgmzyr/article/details/8691053")

	help:describe
     描述插件的属性。它不需要在项目目录下运行。但是你必须提供你想要描述插件的前缀或者 groupId 和 artifactId。
	通过 plugin 参数你可以指定你想要了解哪个插件，你可以传入插件的前缀（如 maven-war-plugin 插件的前缀就是war），或者可以是 groupId:artifact[:version] ，这里 version 是可选的
 	举例说明如下（以maven-war-plugin 为例 ）
 	mvn help:describe -Dplugin=war
 	或者
 	mvn help:describe -Dplugin=org.apache.maven.plugins:maven-war-plugin
 	或者
 	mvn help:describe -DgroupId=org.apache.maven.plugins -DartifactId=maven-war-plugin
 
 	如果想了解详细信息，可以在其后加上-Ddetail 或者 -Dfull
 	如：mvn help:describe -Dplugin=org.apache.maven.plugins:maven-war-plugin -Ddetail


### Tips

#### Maven Dependency Scope

	Transitive dependencies which are compile and runtime scoped usually affect a project regardless of the scope of a direct dependency. Transitive dependencies which are compile scoped will have the same scope regardless of the scope of the direct dependency. Transitive dependencies which are runtime scoped will generally have the same scope of the direct dependency except when the direct dependency has a scope of compile. When a transitive dependency is runtime scoped and a direct is compile scoped the direct dependency the transitive dependency will have an effective scope of runtime.
	

#### Maven Test
[Can I run a specific testng test group via maven?]("http://stackoverflow.com/questions/2922581/can-i-run-a-specific-testng-test-group-via-maven")	

	Try mvn test -Dgroups=group3,group2
	
[Separating Integration Tests from Unit Tests Using Maven Failsafe & JUnit @Category](http://calenlegaspi.blogspot.com/2015/01/separating-integration-tests-from-unit.html)

	There's more than one way to separate integration tests. By default, Failsafe picks up any class with a suffix "IT" or "ITCase", or prefixed with "IT"	
	
	
#### [How do I find out which settings.xml file maven is using](http://stackoverflow.com/questions/9988814/how-do-i-find-out-which-settings-xml-file-maven-is-using)
	
	Use the Maven debug option, ie mvn -X 	
	
#### [Introduction to Plugin Prefix Resolution]	(http://maven.apache.org/guides/introduction/introduction-to-plugin-prefix-mapping.html)

	In order to give users a convenient prefix with which to reference your plugin a prefix must be associated with your plugin when it is built. By default, Maven will make a guess at the plugin-prefix to be used, by removing any instances of "maven" or "plugin" surrounded by hyphens in the plugin's artifact ID. The conventional artifact ID formats to use are:

	maven-${prefix}-plugin - for official plugins maintained by the Apache Maven team itself (you must not use this naming pattern for your plugin, see this note for more informations)
	${prefix}-maven-plugin - for plugins from other sources
	If your plugin's artifactId fits this pattern, Maven will automatically map your plugin to the correct prefix in the metadata stored within your plugin's groupId path on the repository. However, if you want to customize the prefix used to reference your plugin, you can specify the prefix directly through a configuration parameter on the maven-plugin-plugin in your plugin's POM:
	
	<project>
	  ...
  	<build>
    	...
    <plugins>
      ...
      <plugin>
        <artifactId>maven-plugin-plugin</artifactId>
        <version>2.3</version>
        <configuration>
          ...
          <goalPrefix>somePrefix</goalPrefix>
    	    </configuration>
	      </plugin>
    	</plugins>
  	</build>
	</project>
	
	mvn somePrefix:goal

#### [Why Maven command MVN sonar:sonar works without any plugin configuration in my POM.xml](http://stackoverflow.com/questions/14979530/why-maven-command-mvn-sonarsonar-works-without-any-plugin-configuration-in-my-p)

  参考：[Introduction to Plugin Prefix Resolution](http://maven.apache.org/guides/introduction/introduction-to-plugin-prefix-mapping.html)
  
	The reason is that the Sonar Maven Plugin is hosted at the Codehaus Mojo project and benefits from the groupId "org.codehaus.mojo". This allows to use the shortcut "sonar:sonar" instead of "org.codehaus.mojo:sonar-maven-plugin::sonar" (see the section "Configuring Maven to Search for Plugins" of the Maven documentation)

#### [如何显示maven的生命周期](http://stackoverflow.com/questions/1709625/maven-command-to-list-lifecycle-phases-along-with-bound-goals)


	mvn help:describe -Dcmd=compile (or any other valid phase)

#### 子模块如何设置父工程的版本

[Warning on using project.parent.version as the version of a module in Maven 3](http://stackoverflow.com/questions/1981151/warning-on-using-project-parent-version-as-the-version-of-a-module-in-maven-3)

[maven project version inheritance - do I have to specify the parent version](http://stackoverflow.com/questions/10582054/maven-project-version-inheritance-do-i-have-to-specify-the-parent-version)
	
	如果子工程的版本想动态的依赖父工程的版本，用变量的话会收到warning报警。[WARNING] 'version' contains an expression but should be a constant. maven要求必输设置父工程的版本号。只能通过后期的不久措施来设置mvn versions:set -DgenerateBackupPoms=false
	
	如果子工程的自己的版本想要跟着父工程的变化而变化，只有删除子工程的version就还了，子工程会从父工程继承version定义


	