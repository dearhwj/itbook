# 时间序列挖掘-预测算法-三次指数平滑法(Holt-Winters)
原文地址：[http://chenpeng.info/html/2621](http://chenpeng.info/html/2621)

在时间序列中，我们需要基于该时间序列当前已有的数据来预测其在之后的走势，三次指数平滑(Triple/Three Order Exponential Smoothing,Holt-Winters)算法可以很好的进行时间序列的预测。  

时间序列数据一般有以下几种特点：1.趋势(Trend)  2. 季节性(Seasonality)。  

趋势描述的是时间序列的整体走势，比如总体上升或者总体下降。下图所示的时间序列是总体上升的：  

  

[![01144355-e1d1668458a14b849b7e1aa7b500367a](http://static.chenpeng.info/uploads/2014/09/01144355-e1d1668458a14b849b7e1aa7b500367a_thumb.png "01144355-e1d1668458a14b849b7e1aa7b500367a")](http://static.chenpeng.info/uploads/2014/09/01144355-e1d1668458a14b849b7e1aa7b500367a.png)

季节性描述的是数据的周期性波动，比如以年或者周为周期，如下图：  

[![01144710-b931e67d6ba24872b8b37a5ee4e4a250](http://static.chenpeng.info/uploads/2014/09/01144710-b931e67d6ba24872b8b37a5ee4e4a250_thumb.png "01144710-b931e67d6ba24872b8b37a5ee4e4a250")](http://static.chenpeng.info/uploads/2014/09/01144710-b931e67d6ba24872b8b37a5ee4e4a250.png)

三次指数平滑算法可以对同时含有趋势和季节性的时间序列进行预测，该算法是基于一次指数平滑和二次指数平滑算法的。  

**一次指数平滑算法**基于以下的递推关系：  

si=αx<sub>i</sub>+(1-α)s<sub>i-1 </sub>

其中α是**平滑参数**，s<sub>i</sub>是之前i个数据的平滑值，取值为[0,1]，α越接近1，平滑后的值越接近当前时间的数据值，数据越不平滑，α越接近0，平滑后的值越接近前i个数据的平滑值，数据越平滑，α的值通常可以多尝试几次以达到最佳效果。  

一次指数平滑算法进行预测的公式为：x<sub>i+h</sub>=s<sub>i</sub>，其中i为当前最后的一个数据记录的坐标，亦即预测的时间序列为一条直线，不能反映时间序列的趋势和季节性。  

**二次指数平滑**保留了趋势的信息，使得预测的时间序列可以包含之前数据的趋势。二次指数平滑通过添加一个新的变量t来表示平滑后的趋势：  

s<sub>i</sub>=αx<sub>i</sub>+(1-α)(s<sub>i-1</sub>+t<sub>i-1</sub>)  

t<sub>i</sub>=ß(s<sub>i</sub>-s<sub>i-1</sub>)+(1-ß)t<sub>i-1</sub>

二次指数平滑的预测公式为  x<sub>i+h</sub>=s<sub>i</sub>+ht<sub>i  </sub>二次指数平滑的预测结果是一条斜的直线。  

三次指数平滑在二次指数平滑的基础上保留了季节性的信息，使得其可以预测带有季节性的时间序列。三次指数平滑添加了一个新的参数p来表示平滑后的趋势。  

三次指数平滑有累加和累乘两种方法，下面是累加的三次指数平滑  

s<sub>i</sub>=α(x<sub>i-</sub>p<sub>i-k</sub>)+(1-α)(s<sub>i-1</sub>+t<sub>i-1</sub>)  

t<sub>i</sub>=ß(s<sub>i</sub>-s<sub>i-1</sub>)+(1-ß)t<sub>i-1</sub>



p<sub>i</sub>=γ(x<sub>i</sub>-s<sub>i</sub>)+(1-γ)p<sub>i-k</sub>  其中k为周期  

累加三次指数平滑的预测公式为： x<sub>i+h</sub>=s<sub>i</sub>+ht<sub>i</sub>+p<sub>i-k+(h mod k)</sub>  注意：数据之魅P88此处有错误，根据Wikipedia修正。  

下式为累乘的三次指数平滑：  

s<sub>i</sub>=αx<sub>i</sub>/p<sub>i-k</sub>+(1-α)(s<sub>i-1</sub>+t<sub>i-1</sub>)  

t<sub>i</sub>=ß(s<sub>i</sub>-s<sub>i-1</sub>)+(1-ß)t<sub>i-1</sub>

p<sub>i</sub>=γx<sub>i</sub>/s<sub>i</sub>+(1-γ)p<sub>i-k</sub>  其中k为周期  

累乘三次指数平滑的预测公式为： x<sub>i+h</sub>=(s<sub>i</sub>+ht<sub>i</sub>)p<sub>i-k+(h mod k)</sub>   注意：数据之魅P88此处有错误，根据Wikipedia修正。  

**α，ß，γ的值都位于[0,1]之间，可以多试验几次以达到最佳效果。**

**s,t,p初始值的选取对于算法整体的影响不是特别大，通常的取值为s<sub>0</sub>=x<sub>0</sub>,t<sub>0</sub>=x<sub>1</sub>-x<sub>0</sub>,累加时p=0,累乘时p=1.**

<sub></sub>我们使用DataMarket的International Airline Passengers数据来测试累加和累乘三次指数平滑算法的性能，该数据记录的是每月的国际航线乘客数：  

<sub></sub>下图为使用累加三次指数平滑进行预测的效果：其中红色为源时间序列，蓝色为预测的时间序列，α，ß，γ的取值为0.45，0.2，0.95：<sub>  </sub>

[![01152412-2f59942109954e66a861c8b162715210](http://static.chenpeng.info/uploads/2014/09/01152412-2f59942109954e66a861c8b162715210_thumb.png "01152412-2f59942109954e66a861c8b162715210")](http://static.chenpeng.info/uploads/2014/09/01152412-2f59942109954e66a861c8b162715210.png)

下图为累乘三次指数平滑进行预测的效果，α，ß，γ的取值为0.4，0.05，0.9：  

[![01152447-6383c4efa1e04e209a3aa43f23476767](http://static.chenpeng.info/uploads/2014/09/01152447-6383c4efa1e04e209a3aa43f23476767_thumb.png "01152447-6383c4efa1e04e209a3aa43f23476767")](http://static.chenpeng.info/uploads/2014/09/01152447-6383c4efa1e04e209a3aa43f23476767.png)

可以看到三次指数平滑算法可以很好的保存时间序列数据的趋势和季节性信息，在International Airline Passengers数据集上累乘平滑指数算法的效果更好。  

参考文献：  

[1]. 数据之魅：基于开源工具的数据分析  

[2]. [DataMarket: International Airline Passengers](http://datamarket.com/data/set/1byr/airline-traffic-data-by-main-airport#!display=line)

[3]. [Wikipedia: Exponential Smoothing](http://en.wikipedia.org/wiki/Exponential_smoothing)