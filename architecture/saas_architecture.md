# 多租户架构(Multitenancy Architecture)
###基本概念

多租户技术（英语：multi-tenancy technology）或称多重租赁技术，是一种软件架构技术，它是在探讨与实现如何于多用户的环境下共用相同的系统或程序组件，并且仍可确保各用户间数据的隔离性。


***多租户和多用户的区别***

多用户的关键点在于不同的用户拥有不同的访问权限，但是多个用户共享同一个的实例。而在多租户中，多个组织使用的实例各不相同。

***多租户和虚拟化的区别***

多租户和虚拟化在概念是比较类似，都是给每个用户一个虚拟的实例，并且都支持定制化，但是它们作用的层次不同：虚拟化主要是虚拟出一个操作系统的实例，而多租户则是主要虚拟出一个应用的实例。

[Salesforce：五大秘诀让SaaS公司年收入破50亿美元](http://www.itvalue.com.cn/event/monthly/monthly257.html)

[多租户技术](http://baike.baidu.com/view/6838400.htm)

[数据层的多租户浅谈](http://www.ibm.com/developerworks/cn/java/j-lo-dataMultitenant/)


[云计算中的多租户与多租户架构](http://wenku.baidu.com/view/485ce8601ed9ad51f01df274.html?from=search)

[SaaS应用的多租户数据架构关键技术研究](http://www.docin.com/p-769897688.html)

[面向SaaS应用基于键值对模式的多租户索引研究](http://wenku.baidu.com/view/6e492cd9a58da0116c17496c.html?re=view)

[Multi-Tenant Data Architecture](https://msdn.microsoft.com/en-us/library/aa479086.aspx)


[The Force.com Multitenant Architecture](https://developer.salesforce.com/page/Multi_Tenant_Architecture)

[Architectural Concerns in Multi-Tenant SaaS Applications](http://se2.informatik.uni-wuerzburg.de/pa/uploads/papers/paper-371.pdf)


[Salesforce Architecture - How They Handle 1.3 Billion Transactions A Day](http://highscalability.com/blog/2013/9/23/salesforce-architecture-how-they-handle-13-billion-transacti.html)

	Sandbox - an instance of the salesforce.com service that hosts full copies of production orgs for customer application development purposes. Customers using our platform can have full application development lifecycles. These are test environments for customers to do user acceptance testing against their applications before deploying changes into their production org.
	
[How to SaaS](https://blogs.msdn.microsoft.com/rahul/2007/03/27/how-to-saas/)	



