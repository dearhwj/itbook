# 什么是灰度测试和水桶测试？
原文地址：[http://qianwuge.blog.163.com/blog/static/196680284201301332429230/](http://qianwuge.blog.163.com/blog/static/196680284201301332429230/)

在淘宝仲明的一个访谈中第一次看到[灰度测试](http://www.phpchina.com/archives/view-42557-1.html)这个词，其解释是灰度测试的专业说法是Bucket Test。这两个术语都可以互联网应用的测试扯上关系，但是含义还确实不同。

* A/B测试（A/B Testing）：**Wikipedia的定义，“是Web设计（通常指用户体验）中用于区分两种网页设计对收益最大化目标（如点击率）效果支撑程度的一种试验手段”。主要用于比较两种设计的优劣程度。桶测试（Bucket Test）、多变量测试（Multivariate Testing）是A/B测试的变体，因为可能涉及到多种场景的比较。A/B测试还用于市场营销渠道的比较，这和定义是一致的，因为网页就是一种营销渠道。 
* 多变量测试（Multivariate Testing）：这个使用市场营销的一个术语，通常用于在多个变量的复杂环境下，对营销方案效果的比较技术。 
* 桶测试（Bucket Testing）：这个没有什么地方给出明确的定义，但是通常来说是国外用于测试游泳池是否存在漏水行为的一种比较测试。即将一桶水放到泳池中，分别标明内外水位，放置一段时间后，如果外部水位明显下降（超过XXX英寸），则证明水池漏水。这个和软件测试没有什么直接关系，但是他是一种两个方案之间的对比性测试，用于识别缺陷。 
* 测试驱动开发（TDD）：Kent Beck在TDD一书中也提到了水桶和编程的关系，“设想把编程看成是转动曲柄从井里提一桶水上来的过程。如果水桶比较小，那么仅需一个能自由转动的曲柄就可以了。如果水桶比较大而且装满水，那么还没等水桶全部被提上来你就会很累了。你需要一个防倒转的装置，以保证每转一次可以休息一会儿。水桶越重，防倒转的棘齿相距越近。 测试驱动开发中的测试程序就是防倒转装置上的棘齿。一旦我们的某个测试程序能工作了，你就知道，它从现在开始并且以后永远都可以工作了。相比于测试程序没有通过，你距离让所有的测试程序都工作又近了一步。现在我们的工作是让下一个测试程序工作，然后再下一个，就这样一直进行。分析表明，要编程解决的问题越难，每次测试所覆盖的范围就应该越小”这个里面实际上和桶测试（Bucket Testing）没有任何关系，仅仅是一个类比，不用桶，用其他机械装置也是一样对比。
* 灰度交付**：百度百科的定义，“灰度发布是指在黑与白之间，能够平滑过渡的一种发布方式。AB test就是一种灰度发布方式，让一部用户继续用A，一部分用户开始用B，如果用户对B没有什么反对意见，那么逐步扩大范围，把所有用户都迁移到B上面来。灰度发布可以保证整体系统的稳定，在初始灰度的时候就可以发现、调整问题，以保证其影响度。	” 



回到正题上，互联网应用在交付上线过程中（运维部门的职能），需要经过灰度交付和A/B测试两个环节，前者用于检验系统是否稳定可靠，满足上线要求，需要收集和分析性能数据来决定；后者用于检验到底新版本好还是旧版本好，需要收集和分析用户访问数据来决定。



因此结论是灰度交付和A/B测试（桶测试）有不同的目标和手段。



下图是阿里软件的发布引擎，支持灰度交付。

[![image](http://img3.ph.126.net/E3NCzGa53mXN5MGt7UXE8w==/6598261637261203213.jpg)](http://img5.ph.126.net/j1GyfjA0saU4T9qS2c5IYA==/6597469988889236135.jpg)

相关信息：

* [淘宝仲明：揭秘阿里运维部的故障响应机制](http://www.phpchina.com/archives/view-42557-1.html "http://www.phpchina.com/archives/view-42557-1.html")
* [Wikipedia：A/B testing](http://en.wikipedia.org/wiki/A/B_testing "http://en.wikipedia.org/wiki/A/B_testing")
* [Wikipedia：MultiVariage Testing](http://en.wikipedia.org/wiki/Multivariate_testing "http://en.wikipedia.org/wiki/Multivariate_testing")
* [测试驱动开发](http://iknow.seforge.org/classic_book/7ecf51784e667c4d/8f6f4ef68c038bd5-1/bookreference.2009-03-13.1211577687 "http://iknow.seforge.org/classic_book/7ecf51784e667c4d/8f6f4ef68c038bd5-1/bookreference.2009-03-13.1211577687")
* [灰度发布](http://baike.baidu.com/view/2563299.htm "http://baike.baidu.com/view/2563299.htm")