# 转载:python判断指定的端口是否被占用

原文地址:[http://outofmemory.cn/code-snippet/33849/python-decide-specify-port-if-involve](http://outofmemory.cn/code-snippet/33849/python-decide-specify-port-if-involve)


```
#!/usr/bin/env python
# outofmemory.cn codes
import os
import socket
def IsOpen(ip,port):
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        s.connect((ip,int(port)))
        s.shutdown(2)
        print '%d is open' % port
        return True
    except:
        print '%d is down' % port
        return False
if __name__ == '__main__':
    IsOpen('127.0.0.1',800)

```