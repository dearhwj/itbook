# 免密码登录linux服务器
想要面密码登录linux服务器。需要对自己的ssh客户端以及需要登录的宿主机做一些配置！

## 第一步 生成创建公钥

如果你已经创建过公钥，就可以跳过这个步骤。没有的话就先创建公钥,

```
ssh-keygen -t rsa
```

执行成功以后在~/.ssh/ 下会有id_rsa.pub 文件生成

## 第二步 把公钥id_rsa.pub复制到远程机器

```
cat ~/.ssh/id_rsa.pub | ssh root@这里替换成服务器的IP "if [ ! -d '~/.ssh' ]; then mkdir ~/.ssh; fi; cat >> ~/.ssh/authorized_keys"
```

## 第三步 设置远程登陆用户

在客户端的~/.ssh/config中增加以下配置

```
Host 这里替换成宿主机的IP
        user root
```

## 封装一个简单的shell函数

```
function onebox_ssh_init(){
          cat ~/.ssh/id_rsa.pub | ssh $2@$1 "if [ ! -d '~/.ssh' ]; then mkdir ~/.ssh; fi; cat >> ~/.ssh/authorized_keys"
          echo "Host $1" >> ~/.ssh/config
           echo "\tuser $2"  >> ~/.ssh/config
 }
```

把这个脚本放入到自己的.bashrc 或者.zshrc 里面

新增一个宿主机的时候先执行  
1. ssh-keygen -t rsa  
2. onebox_ssh_init 服务器IP 登录用户名 ，提示需要宿主机的登录密码：*******

这样就初始化工作，以后只需要直接ssh  服务器IP 就可以免密码登录linux服务器。

### 备注

介绍的方法适用于全部的linux主机免密码登录，大家根据自己的需要，稍加调整就能定义自己顺手的免密码登录脚本