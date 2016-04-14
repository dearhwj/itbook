# Shell Function按列提取内容
发布日期：2016年4月14日

### 函数
整理了一个Shell Function用来按列提取内容，把下面这段代码加入到自己的bash profile中(bash的~/.bash_profile 或 zsh的~/.zshrc)

```
function cl(){
        if [ $# -eq 2 ] ;  then
                awk -F "[$1]" -v col=$2  '{print $col}'
        else
                awk -v col=$1 '{print $col}'
        fi
}
```

### 使用
cl 这个function有两种用法
用法1： xxx命令 | cl  列号（第一列是1）  这种是以空格或连续空格做为分隔符，按需输出列
用法2： xxx命令 | cl  分隔符 列号（第一列是1） 这种是以指定的符号做为分隔符 ，按需输出列


#### 案例1

prelib包含了以下的文本内容，列和列之间用空格进行分隔

```
命令：head -n 10 prelib

输出：
CoDec-build17-jdk13.jar	256 KB	查看    下载
FlexiProvider-1.6p7.signed.jar	1.22 MB	查看    下载
account-session-api-1.0.2.jar	7.78 KB	查看    下载
ak.sdk-1.0.22.jar	91.27 KB	查看    下载
alimonitor-jmonitor-1.0.0.jar	325.03 KB	查看    下载
alipay-common-lang-2.0.7.jar	4.4 MB	查看    下载
aliyun-java-sdk-core-2.2.0.jar	66.01 KB	查看    下载


```


我们想把第一列jar包的名字提取出来

```
命令：cat prelib| cl 1

输出：
CoDec-build17-jdk13.jar
FlexiProvider-1.6p7.signed.jar
account-session-api-1.0.2.jar
ak.sdk-1.0.22.jar
alimonitor-jmonitor-1.0.0.jar
alipay-common-lang-2.0.7.jar
aliyun-java-sdk-core-2.2.0.jar
aliyun-java-sdk-ecs-h5-new-1.0.0-20160328.120633-1.jar
aliyun-java-sdk-lx-1.0.0.jar
aliyun-openservices-1.2.2.jar


```

#### 案例2
```
二维码,userDataId,registraId,阿里云ID,用户名,registraId,提交时间,ip,用户申请数,ip申请数,状态,危险用户,审核人,审核时间
725285,385825,79152,	1694865393857573,test_xz4@163.com,79152,2016-04-07 13:18,30.9.176.118,1,1,0,false,,

```
上面这个csv文件我们想提取第五列

```
命令： cat 2016-04-08-21-yunqi_shenzhen_vipapply.csv | cl , 5

输出：
用户名
test_xz4@163.com 
 
```


最后说两句：shell命令和编程绝对值得大家去学习，shell的学习成本有点高，2-3个月的时间少不了，我花了更长的时间才基本掌握它，shell命令和编程虽然不能用于写业务代码，但它能在很多时候提升你的工作效率，而且通过学习Shell脚本，使得自己慢慢地能看的懂各种服务启动、编译打包的脚本，潜移默化地具备有Dev ops的基本能力。此外也会让你的mac真正有别于windows，否则mac就是换了壳的windows，当然window也有自己的脚本语言

