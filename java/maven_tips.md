# Maven Tips

### Reference

[Maven: The Complete Reference]("http://books.sonatype.com/mvnref-book/reference/") 

### 插件机制
[Maven 插件机制](http://www.tuicool.com/articles/ry2qAbb)


### Plugin
[Maven Failsafe Plugin](http://maven.apache.org/surefire/maven-failsafe-plugin/)

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

### Maven Dependency Scope

	Transitive dependencies which are compile and runtime scoped usually affect a project regardless of the scope of a direct dependency. Transitive dependencies which are compile scoped will have the same scope regardless of the scope of the direct dependency. Transitive dependencies which are runtime scoped will generally have the same scope of the direct dependency except when the direct dependency has a scope of compile. When a transitive dependency is runtime scoped and a direct is compile scoped the direct dependency the transitive dependency will have an effective scope of runtime.
	

### Maven Test
[Can I run a specific testng test group via maven?]("http://stackoverflow.com/questions/2922581/can-i-run-a-specific-testng-test-group-via-maven")	

	Try mvn test -Dgroups=group3,group2
	
[Separating Integration Tests from Unit Tests Using Maven Failsafe & JUnit @Category](http://calenlegaspi.blogspot.com/2015/01/separating-integration-tests-from-unit.html)

	There's more than one way to separate integration tests. By default, Failsafe picks up any class with a suffix "IT" or "ITCase", or prefixed with "IT"	
	
	
[How do I find out which settings.xml file maven is using](http://stackoverflow.com/questions/9988814/how-do-i-find-out-which-settings-xml-file-maven-is-using)
	
	Use the Maven debug option, ie mvn -X 	
	
[Introduction to Plugin Prefix Resolution]	(http://maven.apache.org/guides/introduction/introduction-to-plugin-prefix-mapping.html)

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

[Why Maven command MVN sonar:sonar works without any plugin configuration in my POM.xml?](http://stackoverflow.com/questions/14979530/why-maven-command-mvn-sonarsonar-works-without-any-plugin-configuration-in-my-p)

  参考：[Introduction to Plugin Prefix Resolution](http://maven.apache.org/guides/introduction/introduction-to-plugin-prefix-mapping.html)
  
	The reason is that the Sonar Maven Plugin is hosted at the Codehaus Mojo project and benefits from the groupId "org.codehaus.mojo". This allows to use the shortcut "sonar:sonar" instead of "org.codehaus.mojo:sonar-maven-plugin::sonar" (see the section "Configuring Maven to Search for Plugins" of the Maven documentation)



	