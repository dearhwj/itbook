# ROA(Resource-Oriented Architecture)面向资源的体系架构

##  服务端REST与SOAP的探讨
原文地址:[http://blog.csdn.net/yanbober/article/details/45308935](http://blog.csdn.net/yanbober/article/details/45308935)

ROA是什么？简单点说，ROA是一种把实际问题转换成REST式Web服务的方法，它使得URI、HTTP和XML具有跟其他Web应用一样的工作方式。在使用ROA进行设计时，我们需要把真实的应用需求转化成ROA中的资源，基本上遵循以下的步骤：

1. 分析应用需求中的数据集。
2. 映射数据集到ROA中的资源。
3. 对于每一资源，命名它的URI。
4. 为每一资源设计其Representations。
5. 用hypermedia links表述资源间的联系。


## RESTful API 你真正需要懂得和后台交互
原文地址：[http://blog.sina.com.cn/s/blog_6c3ac4480102w8qx.html](http://blog.sina.com.cn/s/blog_6c3ac4480102w8qx.html)
过滤信息（Filtering）
如果记录数量很多，服务器不可能都将它们返回给用户。API应该提供参数，过滤返回结果。
下面是一些常见的参数。

```
limit=10：指定返回记录的数量
offset=10：指定返回记录的开始位置。
page=2&per_page=100：指定第几页，以及每页的记录数。
sortby=name&order=asc：指定返回结果按照哪个属性排序，以及排序顺序。
animal_type_id=1：指定筛选条件
```

参数的设计允许存在冗余，即允许API路径和URL参数偶尔有重复。比如，GET /zoo/ID/animals 与 GET /animals?zoo_id=ID 的含义是相同的。





