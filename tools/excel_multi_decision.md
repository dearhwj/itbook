# EXCEL多重判断
原文地址:[http://blog.sina.com.cn/s/blog_603d40f70100esta.html](http://blog.sina.com.cn/s/blog_603d40f70100esta.html)

### 经典法：if多重判断
### vlookup函数妙用法
### VBA进阶1：select case函数

```
Function profitrank(income) As String
Select Case income

    Case Is <= 0

        profitrank = "<=0"

    Case Is <= 5000

        profitrank = "0-5千万"

    Case Is <= 10000

        profitrank = "5千万-1亿"

    Case Is <= 20000

        profitrank = "1亿-2亿"

    Case Is <= 30000

        profitrank = "2亿-3亿"

    Case Is <= 40000

        profitrank = "3亿-4亿"

    Case Is <= 50000

        profitrank = "4亿-5亿"

    Case Is <= 100000

        profitrank = "5亿-10亿"

    Case Else

        profitrank = ">10亿"

    End Select

End Function



```
### VBA进阶2：switch函数