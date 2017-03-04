# 一行命令搞定下载脚本并本地运行

## Python
curl  -fsSL ${scriptURL} | python -

解释一下curl的fsSL的这几个参数：
f:但下载失败的时候不输出任何内容。比如返回code的401，407......
s:Slient模式。不显示进度和错误信息
S:如果使用了-s，S用来显示错误信息
L:跟踪跳转。如果资源被302或301了就跟踪跳转到目标地址！


## Ruby
/usr/bin/ruby -e "$(curl -fsSL ${scriptURL})"


## Shell
curl -fsSL ${scriptURL} | sh


这里会扯出来另外一个话题就是把不确定脚本内容直接执行是有危险的。保护你自己免受 [`curl | sh` 的危害](http://os.51cto.com/art/201410/453620.htm) 这篇文章里面介绍了一些防护方案