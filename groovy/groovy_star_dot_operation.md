# “*.”操作符-连foreach都省了
“*.”操作符的操作对象是一个List对象，如上面的list对象；然后它的结果也是一个List对象；最后还有一个方法，把方法的返回值构成List

```
def list = ['abc','yyyy','1234467']
     
     def sizes = list*.size()
     
     sizes.each{
        println it
     }
 
打印的结果为：
3
4
7

```
