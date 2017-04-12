# Gradle


## gradle setup脚本

1. All the files with .gradle extension under <USER_HOME>/.gradle/init.d directory are treated as initialization scripts. Gradle will execute all the .gradle files under this directory before the execution of any Gradlebuild script.2. Files named init.gradle under <USER_HOME>/.gradle/ are treated as an initialization script.3. All the files with the .gradle extension under <GRADLE_HOME>/init.d/ directory.4. You can even specify any Gradle file as the initialization script with -I <file name>or--init-script <file name>.


## Build script basics

When you execute any build script, Gradle instantiates the org.gradle.api.Project object for the build  le and gives an implicit project object. You can use this object toaccesstheProjectAPIinthebuild leeitherthroughproject.<methodname | property>orsimply<methodname | property>.