# Groovy语言读取Properties文件怎么读
[原文地址](https://zhidao.baidu.com/question/329914340899600565.html)

```
def props = new Properties()
new File("message.properties").withInputStream { 
  stream -> props.load(stream) 
}
```