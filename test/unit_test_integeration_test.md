# 集成测试和单元测试

### 集成测试和单元测试覆盖率合并

[ 集成测试和单元测试覆盖率合并](http://blog.csdn.net/fei33423/article/details/51090354)
	
	集成测试不能直接调用源代码，需要依赖第三方协议和容器，比如http

[官网文档](http://www.mojohaus.org/cobertura-maven-plugin/instrumentingDeploymentArtifact.html)
 
 [Calculating the code coverage of integration tests]( https://blog.avisi.nl/2012/09/25/calculating-the-code-coverage-of-integration-tests/)

   这篇文章主要讲解了如何利用Cobertura 命令行将war包注入统计代码，然后把生成的 cobertura.ser 放入到tomcat启动。 跑Selenium单测，跑完后会得到数据，通过Usecobertura-report to generate the XML or HTML report. 生成结果
