# Gradle


## gradle setup脚本

1. All the files with .gradle extension under <USER_HOME>/.gradle/init.d directory are treated as initialization scripts. Gradle will execute all the .gradle files under this directory before the execution of any Gradlebuild script.2. Files named init.gradle under <USER_HOME>/.gradle/ are treated as an initialization script.3. All the files with the .gradle extension under <GRADLE_HOME>/init.d/ directory.4. You can even specify any Gradle file as the initialization script with -I <file name>or--init-script <file name>.


## Build script basics

When you execute any build script, Gradle instantiates the org.gradle.api.Project object for the build  le and gives an implicit project object. You can use this object toaccesstheProjectAPIinthebuild leeitherthroughproject.<methodname | property>orsimply<methodname | property>.


## 定义Property
Gradle还为我们提供了多种方法来自定义Project的Property。

### 在build.gradle文件中定义Property
在build.gradle文件中向Project添加额外的Property时，我们并不能直接定义，而是应该通过ext来定义。如果要添加一个名为property1的Property，我们应该：

	ext.property1 = "this is property1"
另外，我们也可以通过闭包的方式：

	ext {
   		property2 = "this is property2"
	}

在定义了Property后，使用这些Property时我们则不需要ext，而是可以直接访问
	
	task showProperties << {
   		println property1
	   println property2
	}	
	
### 通过命令行参数定义Property	

Gradle还提供了-P命令行参数来设置Property，比如：

	gradle -Pproperty3="this is property3" showCommandLieProperties

### 通过JVM系统参数定义Property

我们知道，在java中，我们可以通过-D参数定义JVM的系统参数，然后在代码中可以可以通过System.getProperty()进行获取。在Gradle中，我们也可以通过-D的方式向Project传入Property，只是此时我们需要遵循一些约定：每一个通过-D方式声明的Property都需要以“org.gradle.project”为前缀	

### task的执行顺序
被依赖的任务先执行，任务之间没依赖的话，按字母顺序表进行。
另外，提供了3个规则来控制

* shouldRunAfter
* mustRunAfter
* finalyzedBy (more strict in nature)


The difference between mustRunAfter and shouldRunAfter is that mustRunAfter is strict ordering, whereas shouldRunAfter is lenient ordering.


### task任务执行条件

	prodTask.onlyIf {project.hasProperty('environment') && project.environment=='prod' }


### Task rules


### Custom tasks

Gradle provides different ways to add custom tasks in the build script:• The build file• The buildSrc directory inside the project directory• Create a standalone Groovy project


A custom task is a Java or Groovy class that extends from DefaultTask. We can use the @TaskAction annotation to de ne the task actions. You can add multiple actions in a single task. They will execute in the order they are defined. 


### Gradle's in-built plugins

* The Java plugin* The Groovy plugin* The Scala plugin* The War plugin
* The Checkstyle plugin* The FindBugs plugin* The Sonar plugin* The Sonar Runner plugin* The PMD plugin
* The Eclipse plugin* The IDEA plugin### Dependency management  
 Gradle provides a very easy and systematic way to de ne dependencies of the project using the dependencies closure in the following way:

```    compile group: 'log4j', name: 'log4j', version: '1.2.16'
	compile 'log4j:log4j:1.2.16','junit:junit:4.10'   
	compile ('log4j:log4j:1.2.16') ) {           // extra configurations	}
```


* compile
* runtime
* testCompile
* testRuntime
* archives
* default


dependencies{     compile('commons-httpclient:commons-httpclient:3.1') {
	exclude group:'commons-codec' // exclude by group  	// exclude group:'commons-codec',module:'commons-codec'


### Version conficts
Gradle supports different strategies to resolve the version con icts scenarios, they are as follows:
* Latest version: By default Gradle applies the get latest strategy to resolve version conflicts issues if it finds different versions of the same JAR file. In the preceding scenario, it will skip version 1.1 and download the commons- codec JAR of version 1.2.
* fail on conflict: The Get latest strategy might not work always.Sometimes, rather than getting the latest version, you might want thebuild to fail for further investigation. To enable this, you apply the failOnVersionConflict() configuration by adding the following closure:

	```
		configurations.all {       resolutionStrategy {         failOnVersionConflict()       }		}
	```
* Force specific version: In conflict situations, another alternative could be, rather than failing the build, you can download specific version of a JAR. This can be achieved by using force flag:
	```        dependencies {         compile group:'commons-httpclient', name:'commons-       httpclient', version:'3.1'         compile group:'commons-codec',name:'commons-codec',       version:'1.1', force:true       }
	```
	
* Dynamic dependency：To make the build  exible on the jar version, you can use the latest.integration placeholder, or you can de ne a version range such as 1.+.
   ```
    compile group:'commons-codec',name:'commons-codec', version:   'latest.integration'
   ```
   
* Replacing transitive dependencies:  If you do not want to download the existing transitive dependencies and want to replace them with your customized transitive dependencies, Gradle provides the following way
	```   dependencies {     compile module(group:'commons-httpclient', name:'commons-       httpclient', version:'3.1') {       dependencies "commons-codec:commons-codec:1.1@jar"     }	}
	```
	 	
	
### Repositories conguration
For dependencies listed in the dependencies closure, Gradle searches repositories in sequential order. If it  nds a library or a dependency in one of the repositories (if multiple repositories are con gured), it skips searching other repositories. In the next section, we will learn how to con gure different repositories.

```
repositories {         mavenCentral()
         jcenter()
         mavenLocal()
         
         ivy {           url "http://<ivyrepositorylocation>"           layout "ivy"  // valid values are maven, gradle, ivy         }
         
         
         
         }```

1. mavenCentral:Maven Central repository
1. jcenter:Maven JCenter repository
1. mavenLocal:Maven local Repository
2. ivy:Ivy repositoryTo use your organization's private repository, you can configure the Repositories location in the following format

```
repositories {         maven {           url "http://private.repository/path"           credentials {             username 'guest'             password '123123'           }         }         ivy { // For Ivy repositories         url "http://private.repository/path"         }}

```

### Publishing artifacts

```


	apply plugin: 'java'   archivesBaseName="MySample" // to customize Jar Name   version=1.0   repositories {     mavenCentral()   }   def confFile = file('configurations.xml') // artifact2   artifacts {      archives confFile	}uploadArchives {
repositories {   flatDir {dirs "./tempRepo"}} }



 gradle uploadArchives
 
```
maven-publish plugins

```
apply plugin: 'java'   apply plugin: 'maven-publish'publishing {  publications {
  
  mavenJava(MavenPublication) {         from components.java         groupId 'org.mygroup'         artifactId 'MySampleProj'         version '1.0'} }}
```  


### Working with Gradle
#### The War plugin
War plugin extends the Java plugin and helps to create the war archives. The war plugin automatically applies the Java plugin to the build  le. During the build process, the plugin creates a war  le instead of a jar  le. The war plugin disables the jar task of the Java plugin and adds a default war archive task. By default, the content of the war  le will be compiled classes from src/main/java; content from src/main/webapp and all the runtime dependencies. The content can be customized using the war closure as well.


#### Logging

* ERROR：This is used to show error messages* QUIET：This is used to show limited useful information* WARNING：This is used to show warning messages* LIFECYCLE：This is used to show the progress (default level)* INFO：This is used to show information messages* DEBUG：This is used to show debug messages (all logs* -q:This will show logs up to the quiet level. It will include error and quiet messages* -i:This will show logs up to the info level. It will include error, quiet, warning, lifecycle and info messages.* -s:This prints out the stacktrace for all exceptions.* -d:This prints out all logs and debug information. This is most expressive log level, which will also print all the minor details.#### gradle.properties
Gradle provides a default mechanism of reading the properties  le using gradle.properties. You can add the gradle.properties  le in any of the following locations:1. <USER_HOME>/.gradle: gradle.properties defined under this directory would be accessible to all the projects. You can use this fileto define global properties and you can access these properties using $project.<propertyname>. If you have defined GRADLE_USER_HOME to some other directory, then Gradle will skip the <USER_HOME>/.gradle directory and will read gradle.properties from the GRADLE_USER_HOME directory.
2. <ProjectDir>: gradle.properties defined under this directory would be accessible to the current project. You cannot access these properties from any other project. So, all the project-specific properties can be defined in the project's gradle.properties file.