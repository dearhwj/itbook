# Maven插件开发


### Guide to Developing Java Plugins

[Guide to Developing Java Plugins](http://maven.apache.org/guides/plugin/guide-java-plugin-development.html)

You will typically name your plugin <yourplugin>-maven-plugin.Calling it maven-<yourplugin>-plugin (note "Maven" is at the beginning of the plugin name) is strongly discouraged since it's a reserved naming pattern for official Apache Maven plugins maintained by the Apache Maven team with groupId org.apache.maven.plugins. Using this naming pattern is an infringement of the Apache Maven Trademark.



### Your First Plugin

[http://maven.apache.org/guides/plugin/guide-java-plugin-development.html](http://maven.apache.org/guides/plugin/guide-java-plugin-development.html)

When processing the source tree to find mojos, plugin-tools looks for classes with either @Mojo Java 5 annotation or "goal" javadoc annotation. Any class with this annotation are included in the plugin configuration file.



```

package sample.plugin;
 
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;
 
/**
 * Says "Hi" to the user.
 *
 */
@Mojo( name = "sayhi")
public class GreetingMojo extends AbstractMojo
{
    public void execute() throws MojoExecutionException
    {
        getLog().info( "Hello, world." );
    }
}

```




Aether
Aether is a library for working with artifact repositories. Aether deals with the specification of local repository, remote repository, developer workspaces, artifact transports, and artifact resolution.


Maven Compat
Maven2 classes maintained as compatibility layer.


Maven Embedder
Maven embeddable component, with CLI and logging support.

### 开发资料

[Lifecycles Reference](https://maven.apache.org/ref/3.3.9/maven-core/lifecycles.html)

[Using Plugin Tools Java5 Annotations](http://maven.apache.org/plugin-tools/maven-plugin-plugin/examples/using-annotations.html)


[Guide to Configuring Plug-ins](http://maven.apache.org/guides/mini/guide-configuring-plugins.html#Using_the_executions_Tag)


[Introduction to the Build Lifecycle](http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)



