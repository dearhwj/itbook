# Maven Tips

### Reference

[Maven: The Complete Reference]("http://books.sonatype.com/mvnref-book/reference/") 

### 插件机制
[Maven 插件机制](http://www.tuicool.com/articles/ry2qAbb)


### Plugin
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


	