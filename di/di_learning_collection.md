# 数据智能资源大全


[算术平均数](http://baike.baidu.com/view/415917.htm)
	
	算术平均数（ arithmetic mean），又称均值，是统计学中最基本、最常用的一种平均指标，分为简单算术平均数、加权算术平均数。它主要适用于数值型数据，不适用于品质数据。根据表现形式的不同，算术平均数有不同的计算形式和计算公式。
	算术平均数是加权平均数的一种特殊形式（特殊在各项的权重相等）。在实际问题中，当各项权重不相等时，计算平均数时就要采用加权平均数；当各项权相等时，计算平均数就要采用算术平均数。


[标准差（Standard Deviation](http://baike.baidu.com/view/78339.htm)

	标准差（Standard Deviation） ，中文环境中又常称均方差，但不同于均方误差（mean squared error，均方误差是各数据偏离真实值的距离平方和的平均数，也即误差平方和的平均数，计算公式形式上接近方差，它的开方叫均方根误差，均方根误差才和标准差形式上接近），标准差是离均差平方和平均后的方根，用σ表示。标准差是方差的算术平方根。标准差能反映一个数据集的离散程度。平均数相同的两组组数据，标准差未必相同。
	
	
[数据归一化和两种常用的归一化方法](http://www.cnblogs.com/chaosimple/archive/2013/07/31/3227271.html)

	数据标准化（归一化）处理是数据挖掘的一项基础工作，不同评价指标往往具有不同的量纲和量纲单位，这样的情况会影响到数据分析的结果，为了消除指标之间的量纲影响，需要进行数据标准化处理，以解决数据指标之间的可比性。原始数据经过数据标准化处理后，各指标处于同一数量级，适合进行综合对比评价。以下是两种常用的归一化方法：
	一、min-max标准化（Min-Max Normalization）
	也称为离差标准化，是对原始数据的线性变换，使结果值映射到[0 - 1]之间。
	二、Z-score标准化方法
	这种方法给予原始数据的均值（mean）和标准差（standard deviation）进行数据的标准化。经过处理的数据符合标准正态分布，即均值为0，标准差为1，		
	
[为什么一些机器学习模型需要对数据进行归一化](http://www.cnblogs.com/LBSer/p/4440590.html)

	归一化为什么能提高梯度下降法求解最优解的速度？
	归一化有可能提高精度
	归一化的类型	
	

[使用Spark MLlib给豆瓣用户推荐电影](http://www.colobu.com/2015/11/30/movie-recommendation-for-douban-users-by-spark-mllib/)

[为豆瓣电影实现User-based协同过滤的推荐系统](http://www.colobu.com/2015/12/02/user-based-recommender-for-douban-movies/)

[为豆瓣电影实现Item-based协同过滤的推荐系统](http://www.colobu.com/2015/12/03/item-based-recommender-for-douban-movies/)



[搜索引擎算法:信息指纹算法,分段签名算法,关键词复制网页算法随机映射算法,近似网页发现算法研究](http://www.xituzhidu.net/post/271.html)

	信息指纹算法
	分段签名算法
	基于关键词的复制网页算法
	 随机映射算法
	 近似网页发现算法


[TF-IDF与余弦相似性的应用（一）：自动提取关键词](http://www.ruanyifeng.com/blog/2013/03/tf-idf.html)

	TF-IDF与一个词在文档中的出现次数成正比，与该词在整个语言中的出现次数成反比。
	
[F-IDF与余弦相似性的应用（二）：找出相似文章](http://www.ruanyifeng.com/blog/2013/03/cosine_similarity.html)	
	
	　（1）使用TF-IDF算法，找出两篇文章的关键词；
	　（2）每篇文章各取出若干个关键词（比如20个），合并成一个集合，计算每篇文章对于这个集合中的词的词频（为了避免文章长度的差异，可以使用相对词频）；
	　（3）生成两篇文章各自的词频向量；
	　（4）计算两个向量的余弦相似度，值越大就表示越相似。
		
		"余弦相似度"是一种非常有用的算法，只要是计算两个向量的相似程度，都可以采用它。		

[Slope One :简单高效的协同过滤算法(Collaborative Filtering)](http://www.cnblogs.com/kuber/archive/2008/06/10/1216846.html)





[基于物品的协同过滤推荐算法——读“Item-Based Collaborative Filtering Recommendation Algorithms”](http://blog.csdn.net/huagong_adu/article/details/7362908)

[详细解释数据挖掘中的 10 大算法（上）](http://blog.jobbole.com/90316/)
	
	1、C4.5算法
	2. k 均值聚类算法
	3.支持向量机
	4. Apriori 关联算法
	5.EM 最大期望算法 Expectation Maximization
	
[详细解释数据挖掘中的 10 大算法（下）](http://blog.jobbole.com/89037/)

	6.PageRank算法
	7.AdaBoost 迭代算法
	8.kNN：k最近邻算法
	9. Naive Bayes 朴素贝叶斯算法
	10.CART 分类算法
	

[机器学习常见的算法面试题总结](http://www.codeceo.com/article/machine-learn-algorithm-interview.html)



[推荐！国外程序员整理的机器学习资源大全](http://blog.jobbole.com/73806/)

[一文读懂机器学习，大数据/自然语言处理/算法全有了](http://blog.csdn.net/bluejoe2000/article/details/50890001)

	机器学习是一种能够赋予机器学习的能力以此让它完成直接编程无法完成的功能的方法。但从实践的意义上来说，机器学习是一种通过利用数据，训练出模型，然后使用模型预测的一种方法。
	
	首先，我们需要在计算机中存储历史的数据。接着，我们将这些 数据通过机器学习算法进行处理，这个过程在机器学习中叫做“训练”，处理的结果可以被我们用来对新的数据进行预测，这个结果一般称之为“模型”。对新数据 的预测过程在机器学习中叫做“预测”。“训练”与“预测”是机器学习的两个过程，“模型”则是过程的中间输出结果，“训练”产生“模型”，“模型”指导 “预测”。


[ 大数据技术学习路线](http://heminit.com/2017/06/23/my-post2/)

