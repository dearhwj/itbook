# ROA(Resource-Oriented Architecture)面向资源的体系架构
原文地址:[http://blog.csdn.net/yanbober/article/details/45308935](http://blog.csdn.net/yanbober/article/details/45308935)

ROA是什么？简单点说，ROA是一种把实际问题转换成REST式Web服务的方法，它使得URI、HTTP和XML具有跟其他Web应用一样的工作方式。在使用ROA进行设计时，我们需要把真实的应用需求转化成ROA中的资源，基本上遵循以下的步骤：

1. 分析应用需求中的数据集。
2. 映射数据集到ROA中的资源。
3. 对于每一资源，命名它的URI。
4. 为每一资源设计其Representations。
5. 用hypermedia links表述资源间的联系。