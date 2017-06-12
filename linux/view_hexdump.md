# linux下查看十六进制文件方法
原文[http://blog.csdn.net/ljasdf123/article/details/8531087](http://blog.csdn.net/ljasdf123/article/details/8531087)

## hexdump
hexdump - ascii, decimal, hexadecimal, octal dump
  查看十六机制的首选工具。
  -c 每单元以字节为单位，显示出对应的ASCII码
  -C 每单元以字节为单位，同时显示十六机制和ASCII码
  例：
  
 ``` 
chenglian@chenglian-desktop:~/test$ hexdump -c asm | more
0000000 177   E   L   F 001 001 001  /0  /0  /0  /0  /0  /0  /0  /0  /0
0000010 002  /0 003  /0 001  /0  /0  /0   T 200 004  /b   4  /0  /0  /0

chenglian@chenglian-desktop:~/test$ hexdump -C asm | more
00000000  7f 45 4c 46 01 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 03 00 01 00 00 00  54 80 04 08 34 00 00 00  |........T...4...|
```


