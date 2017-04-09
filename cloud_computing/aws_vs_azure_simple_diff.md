# AWS & Azure简单对比
## 账号和订阅

Azure的 subscription（订阅）是计费和权限管控的组。AWS是把所有的资源都跟AWS的的账号直接关联的。而订阅是独立于它们的owner账号，可以重新分配给新的owner。


![](https://docs.microsoft.com/en-us/azure/architecture/aws-professional/images/azure-aws-account-compare.png)

subscription有3种不同类型的管理员账号
1. 账号管理员。订阅的Owner，而且为账号的资源付款。只能通过移交订阅的所有权来实现订阅的账号管理员的变更。
2. 服务管理员。主要是用于创建和管理订阅中的资源，但不负责billing。缺省情况下，账号管理和服务管理员是同一个账号，然后账号管理员把服务管理员给到其他账号，
3. 协作管理员。一个订阅有可以有多个协作管理员。协作管理员不能改变服务管理员，但是可以管理订阅的资源和用户


在订阅级别的用户角色以为，类似于AWS中IAM中管理用户权限，单个的权限可以给到特定的资源。在Azure里面所有的用户账号关联到微软的账号或者组织账号(通过Azure的AD管理的账号)


## 资源管理
Azure和AWS中资源组的概念是不同的。AWS中一个资源可以归属到多个资源组，而在azure里面只能归属到一个资源组。 在azure里面也可以通过tag来组织资源，tag以key-value的形式来夸订阅组织资源。


## 管理界面
Azure提供了不同的管理界面。Web interface、Command Line、PowerShell、Templates。这些语法和结果都是不同于AWS的，但有提供了类似的功能。除此以外，AWS上可以使用的第三方管理工具，类似Hashicorp's Terraform 和Netflix Spinnaker也都支持Azure

## Regions和zones(高可用)
在AWS，region被分成2个或者更多的可用区。在物理region中每个可用区对应到了物理隔离的数据中心。如果你部署你的应用服务器到不同的可用区，一个zone内的硬件或者链接故障不会影响其他zone里面的服务器。

在Azure，容错域( fault domain)指的是共享了同一个物理电源和网络交换机。你可以利用可用集(availability sets )把多个VM分配到多个容错区。如果实例安排到同一个可用集里面，Azure会把他们均匀地分配到几个容错域。在一个容错区里面出现的电力和网络的故障不会影响到其他的容错区。
![](https://docs.microsoft.com/en-us/azure/architecture/aws-professional/images/zone-fault-domains.png)

在Azure，可以使用“配对region”(paired regions)来实现跨2个预定义的物理region的冗余，以确保当整个region都不可用的时候，你的服务也是可以用的。不同于AWS的可用区，AWS的可用区是物理上分离但相隔比较近的数据中心。Azure的paired regions通常至少相隔300英里。这么做的目的是确保当出现了大规模的灾难的时候，只会影响配对region里面的其中一个。配对region间保证数据库和存储服务数据的同步，并且同一时间内配对region中只有其中一个会进行平台升级。

Azure的异地冗余存储服务会自动备份到相应的配对region。

### 参考资料

[Introduction to Microsoft Azure accounts, platform, and services for AWS experts](https://docs.microsoft.com/en-us/azure/architecture/aws-professional/index)
