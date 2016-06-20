# 在CISE上定制集成测试环境


1. 把集成测试的代码跟生产代码写在一个工程，不同的module里面里面，这样的好处就是可以降低测试用例的维护成本
2. CISE的集成测试要能自动部署相应的集成测试环境.如果测试的分支是master，就拉取日常环境的aone配置，并进行测试。如果测试分支是branch，去拉取相应的aone项目项目环境的配置并完成部署
3. 集成测试依赖服务提供的service，在cise上运行测试可以依赖相应的集成测试服务provider，如果整个集成测试流程中会启动集成测试环境（tomcat+HSF），可以利用[HSF指定IP调用](http://gitlab.alibaba-inc.com/middleware/hsf2-0/wikis/user_specified_target_invoke)功能调用到特定的HSF Provider上。但在本地运行单元测试的时候，可以识别相应的选项直接依赖默认的服务provider。

### 自定义CISE镜像
1. CISE提供了[CISE制作自有镜像(自定义镜像)](http://docs.alibaba-inc.com:8090/pages/viewpage.action?pageId=242953509)功能，可以自定义集成测试的运行环境，例如tomcat、jdk、maven等等。我自定义了一个cise_aliyun_tomcat7_mvn3的镜像，这个镜像支持了tomcat7和maven3。但目前这镜像和cise的标准镜像不兼容，导致一些cise的一些指令运行不了比如jdk和maven版本的定制；还有一个问题，因为是自定义镜像，CISE不会预创建该镜像对应的服务器，所以整个初始化+启动的过程会比标准的CISE镜像慢好多。
2. 这个镜像里面增加了一个init_server shell脚本来初始化环境,install_model.sh这个脚本是PE提供的跟线上的保持一致

	``` java

   	#!/bin/bash 

	wget http://config.aliyun-inc.com/root/scripts/cloud/install_model.sh -O /var/tmp/i
    nstall_model.sh

    bash /var/tmp/install_model.sh
    
 	if [[ $1 = test ]];then
 		wget http://hearthstone.aliyun-inc.com/init_app/init_app.sh -O /var/tmp/init_app.sh
       bash /var/tmp/init_app.sh $2 $3 $4 $5 $6 $7 $8 $9
    fi
 
  	MAVEN_HOME=/opt/maven
	PATH=$PATH:$MAVEN_HOME/bin
  	export MAVEN_HOME PATH

	```  		 	

### 从Aone获取配置项生成antx.properties
1. 由于CISE准备集成测试环境的时候需要提取相应的配置项。如果是master或trunk，获取aone应用中的日程环境配置生成antx.propertis,branch分支需要获取相应的项目环境的配置项并生成antx.properties。目前Aone提供了相应的ip来实现相应的需求，参考[Aone配置项相关的API](http://docs.alibaba-inc.com/pages/viewpage.action?pageId=251345249)。以下的脚本用来从读取aone的读取配置，生成antx.propertis

	``` java

	#!/bin/sh
	#export LANG=zh_CN.UTF-8

	filepath="/opt/source"
	cd $filepath

	crid=$(echo "$1")
	if [ ! -n "$1" ] ; then api="get_diana_trunk";else api="get_cr_config";fi


	if [[ $scm_branch == *"master"* ]] || [[ $scm_branch == *"trunk"* ]]
	then
    	AONE_CONFIG_URL="http://aone-api.alibaba-inc.com/aone2/anonymous/openapi/$api/diana/OBJ_STR?appName=aliyun_com_service&schema=daily&crid=$crid&token=QXBwbGljYXRpb246MjI3Njc6"
	else
    	AONE_CONFIG_URL="http://aone-api.alibaba-inc.com/aone2/anonymous/openapi/$api/diana/OBJ_STR?appName=aliyun_com_service&schema=project&crid=$crid&token=QXBwbGljYXRpb246MjI3Njc6"
	fi

	curl $AONE_CONFIG_URL  > antx.properties
	dos2unix antx.properties

	```

### 开发集成测试用例
1. 我们还是用Groovy+Spock框架编写集成测试用例，测试代码都集中在test这个module里面，命名规则*ITCase。
2. 在pom文件中配置failsafe，运行集成测试。并利用cise的parser单元测试case解析插件分析测试用例的结果。
3. 最后调整.cise.yml



### 最后

	


# 参考资料
1. [CISE变量引用](http://docs.alibaba-inc.com/pages/viewpage.action?pageId=204080374)
2. [CISE制作自有镜像(自定义镜像)](http://docs.alibaba-inc.com:8090/pages/viewpage.action?pageId=242953509)
3. [Aone配置项相关的API](http://docs.alibaba-inc.com/pages/viewpage.action?pageId=251345249)
1. [HSF指定IP调用](http://gitlab.alibaba-inc.com/middleware/hsf2-0/wikis/user_specified_target_invoke)
2. [Maven Failsafe Plugin](http://maven.apache.org/surefire/maven-failsafe-plugin/)
3. [parser单元测试case解析插件](http://docs.alibaba-inc.com/pages/viewpage.action?pageId=230520605)

