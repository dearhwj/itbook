# Shell去除空行的几种方法

原文地址:[http://www.jb51.net/article/57953.htm](http://www.jb51.net/article/57953.htm)
## 用tr命令

```
cat 文件名 |tr -s ‘\n'
```


## 用sed命令

```
cat 文件名 |sed ‘/^$/d'
```

^匹配行首，$匹配行尾，所以^$匹配“行尾紧跟着行首”，也就是空行。d删除两个/包含的正则匹配

## 用awk命令
```
cat 文件名 |awk ‘{if($0!=”")print}'
cat 文件名 |awk ‘{if(length !=0) print $0}'
```


## 用grep命令
```
grep -v “^$” 文件名

```

