# 通过ping解析域名IP

## 源代码

```
function getDomainIp(){
    ping -c 1 $1 | egrep "\(.*\)"   | awk -F '[ ()]' '{ print $4 }'
}



```

### 参考资料
[shell实战之：通过ping批量解析域名的DNS](http://www.2cto.com/os/201309/246878.html)