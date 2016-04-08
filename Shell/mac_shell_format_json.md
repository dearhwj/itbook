# MAC下通过命令行格式化JSON
日常工作中我们经常需要把某个URL返回的JSON格式化一下，方便阅读。一般我们是先把URL的返回复制到剪贴板，然后打开类似[http://www.bejson.com/](http://www.bejson.com/) 这样的网站把剪贴板的内容复制进去，通过网页的功能进行格式化，甚至要重新复制粘贴到本地的编辑器来看。

其实python自带json的格式化功能 -python -m json.tool
先看一下示例

```
curl "JSON HTTP"  | python -m json.tool 

例如
http://promotion.aliyun.test/form/yunqiSignIn  原始的输出是

{"code":-1,"msg":"method must be post"}

curl http://promotion.aliyun.test/form/yunqiSignIn | python -m json.tool 
会格式化返回

% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    39  100    39    0     0   1479      0 --:--:-- --:--:-- --:--:--  1444
{
    "code": -1,
    "msg": "method must be post"
}

```

然后我们封装两个shell的function方便使用
一个是将格式化的内容复制到剪贴板中去

```
function jsonFormat2Clipboard(){
        curl $1  | python -m json.tool | pbcopy
}

备注:pbcopy 是mac下剪贴板命令行工具，最多的使用场景是通过管道把前一个命令的输出复制到剪贴板，我们这里是将 python -m json.tool的输出复制到剪贴板了
```

再封装一个shell函数可以把格式化的内容直接用编辑器打开的

```
function jsonFormat2Open(){
        file_name="$TMPDIR/json_format_$RANDOM.txt"
        curl $1  | python -m json.tool >> file_name
        open file_name
}

```

把这两个functioin 加入到你的bash_profile文件中，我用的是zsh对应的是~/.zshrc ,命令行中输入function的前缀会提示完整的function名称。

写完以后，才发现绝大多数情况下，我们的URL都是需要登录的，curl这个命令不能访问需要登录的URL，所以这两个函数用处不大，大家记得下面两个基础的函数就好。 

1. python -m json.tool 
2. pbcopy





