# Azure消费数据API
 
参考[Get consumption data for an Azure subscription](https://msdn.microsoft.com/en-us/library/azure/mt219001.aspx)

## 资源使用（Resource Usage）
### 查询参数

|参数名称| 必须/可选|说明|
| --- | ---| --- |
| reportedStartTime 和 reportedEndTime |必选| Reported Time 代表了资源的使用在Azure 计费系统中的记录的时间。由于Azure有多个数据中心，就一定会存在资源实际消耗时间和资源使用汇报时间的延迟,所以调用方需要有一种预见性的方式来获取一次订阅指定时间段内所有的使用事件，因此需要调用方根据Reported Time来查询来保证调用方获取了billing系统中一个特定的时间段内所有的消费事件。虽然查询是通过Reported Time查询的，但是根据资源的使用时间聚合的
| aggregationGranularity |可选|聚合粒度。可选。取值范围Daily或Hourly，默认值Daily。跟据不同的值返回不同粒度的值|
| showDetails |可选|取值范围：true 或false，默认值：true。这个参数用来设定是否获取实例级别的详细使用数据，比如你有3个website（web1、web2、web2），缺省会获取3条website的消费数据。如果showDetails =false，我们会拿到单条website 的消费数据，也就就是说会把同一个subscriptionId、meterId、usageStartTime、usageEndTime聚合成单条数据|
| continuationToken |可选| continuationToken从前一次调用的返回中获取，这是对一个大数据集合查询过程的一个bookmark，如果没这个参数就会从数据开始的地方开始获取|


### 返回值

| 名称    | 说明 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
| --- | ----|
| Id               | 使用量合计的唯一ID |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
| name             | 使用量合计的名称    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
| subscriptionId   | Azure用户的订购ID   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
| meterId          | 资源唯一ID，也就是ResourceID |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| usageStartTime   | 归属时间段的开始时间|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
| usageEndTime     | 归属时间段的开始时间|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
| Quantity         | 使用量 ，这个地方应该有很多的扩展不止Quantity 一个字段|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
| Unit             | 单位|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| meterName        | 消费资源的名称|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
| meterCategory    | 消费资源的分类|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
| meterSubCategory | 消费资源的子分类  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
| meterRegion      | 消费资源的region    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
| infoFields       |实例信息的key/value信息（遗留格式） | 
| instanceData |实例信息的key/value信息，保存了resourceUri 、tags、location、扩展信息（OS版本、Image类型......） 、partNumber（唯一的namespace用来标识azure的三方市场）、orderNumber（唯一的ID标志第三方的订单识别码）|

### 

返回样例

输入：```https://management.azure.com/subscriptions/{subscription-Id}/providers/Microsoft.Commerce/UsageAggregates?api-version=2015-06-01-preview&reportedStartTime=2014-05-01T00%3a00%3a00%2b00%3a00&reportedEndTime=2015-06-01T00%3a00%3a00%2b00%3a00&aggregationGranularity=Daily&showDetails=false```

这个查询aggregationGranularity=Daily&showDetails=false

```json
{
    "value": [
        {
            "id": "/subscriptions/f68815e6-3c41-45ef-bbd8-5f83303c396b/providers/Microsoft.Commerce/UsageAggregates/Daily_BRSDF_20140501_0000",
            "name": "Daily_BRSDF_20140501_0000",
            "type": "Microsoft.Commerce/UsageAggregate",
            "properties": {
                "subscriptionId": "f68815e6-3c41-45ef-bbd8-5f83303c396b",
                "usageStartTime": "2015-03-03T00:00:00+00:00",
                "usageEndTime": "2015-03-04T00:00:00+00:00",
                "meterName": "Standard IO – Page Blob/Disk (GB)",
                "meterCategory": "Storage",
                "meterSubCategory": "Geo Redundant",
                "unit": "GB",
                "meterId": "0e9d0c9b-ab6d-4312-9c7e-3794e22af9c4",
                "infoFields": {
                },
                "quantity": 0.057865
            }
        },
…

```


```https://management.azure.com/subscriptions/{subscription-Id}/providers/Microsoft.Commerce/UsageAggregates?api-version=2015-06-01-preview&reportedStartTime=2014-05-01T00%3a00%3a00%2b00%3a00&reportedEndTime=2015-06-01T00%3a00%3a00%2b00%3a00&aggregationGranularity=Daily&showDetails=true```

这个查询showDetails=true 在infoFields中提供了一些详细信息


下面这个格式返回了新的响应格式，提供了“instanceData”，这个instance-level的明细数据包括了资源URI、tag等信息

``` json

{
  "value": [
        {
      "id": "/subscriptions/d657c399-e17c-405d-859e-9f2efb6462e5/providers/Microsoft.Commerce/UsageAggregates/Daily_BRSDT_20150515_0000",
      "name": "Daily_BRSDT_20150515_0000",
      "type": "Microsoft.Commerce/UsageAggregate",
      "properties": {
        "subscriptionId": "d657c399-e17c-405d-859e-9f2efb6462e5",
        "usageStartTime": "2015-05-15T00:00:00+00:00",
        "usageEndTime": "2015-05-16T00:00:00+00:00",
        "instanceData": "{\"Microsoft.Resources\":{\"resourceUri\":\"/subscriptions/d657c399-e17c-405d-859e-9f2efb6462e5/resourceGroups/moinakrg/providers/Microsoft.Storage/storageAccounts/moinakstorage\",\"location\":\"West US\",\"tags\":{\"department\":\"hr\"}}}",
        "meterName": "Storage Transactions (in 10,000s)",
        "meterCategory": "Data Management",
        "unit": "10,000s",
        "meterId": "964c283a-83a3-4dd4-8baf-59511998fe8b",
        "infoFields": {

        },
        "quantity": 9.8390
      }
    },
    {
      "id": "/subscriptions/d657c399-e17c-405d-859e-9f2efb6462e5/providers/Microsoft.Commerce/UsageAggregates/Daily_BRSDT_20150515_0000",
      "name": "Daily_BRSDT_20150515_0000",
      "type": "Microsoft.Commerce/UsageAggregate",
      "properties": {
        "subscriptionId": "d657c399-e17c-405d-859e-9f2efb6462e5",
        "usageStartTime": "2015-05-15T00:00:00+00:00",
        "usageEndTime": "2015-05-16T00:00:00+00:00",
        "instanceData": "{\"Microsoft.Resources\":{\"resourceUri\":\"/subscriptions/d657c399-e17c-405d-859e-9f2efb6462e5/resourceGroups/moinakrg/providers/Microsoft.Storage/storageAccounts/moinakstorage\",\"location\":\"West US\",\"tags\":{\"department\":\"hr\"}}}",
        "meterName": "Data Transfer In (GB)",
        "meterRegion": "Zone 1",
        "meterCategory": "Networking",
        "unit": "GB",
        "meterId": "32c3ebec-1646-49e3-8127-2cafbd3a04d8",
        "infoFields": {

        },
        "quantity": 0.000066
      }
    }, 
…


```


## Resource RateCard
### 用途
查询当前订阅中资源/计量的metadata以及相关的价格。[原文地址:Get price and metadata information for resources used in an Azure subscription](https://msdn.microsoft.com/en-us/library/azure/mt219004.aspx)
就是提供客户当前拥有的资源的会按什么样规则收钱（可以用来做价格预测），不是已经消费的金额。这个api我们是没有的。

### 查询参数
|参数名称|必选/可选|说明|
| --- |--- | --- |
| OfferDurableId |必选|这个OfferDurableId 由“MS-AZR-”+OfferID，[Microsoft Azure Offer Details](http://azure.microsoft.com/en-us/support/legal/offer-details/) 这个里面有完整的OfferID列表|
| Currency |必选|需要提供的资源单价的货币类型，例如USD |
| Locale |必选|需要资源的metadata本地化的文字，例如en-US|
| RegionInfo |offer购买的ISO Code|


### 返回值

| 名称   | 说明  |
| --- | --- |
| Credit           | 能提供的信用额度额度 |                                                                               
| Currency         | 货币单位   |                                                                                                                                                                         
| EffectiveDate    | 生效时间  |
| ExcludedMeterIds | 排除的资源ID|
| IncludedQuantity | 免费数量，超过这个数量开始收费 |
| IsTaxIncluded    | 是否含税  |                                                                                                                                                       
| Locale           | 本地化  |                                                                                                                                                                
| MeterCategory    | 计量分类   |
| MeterId          |资源ID                        |
| MeterName        | 计量名称 |                                                                                                                                                                       
| MeterRates       | 计量率。The list of key/value pairs for the meter rates, in the format “key”:”value” where key = the meter quantity, and value = the corresponding price. |                                                                             
| MeterRegion      | 计量region  |
| MeterSubCategory |计量的子分类    |                                                                    
| MeterStatus      | 计量状态 "Active" or "Deprecated".   |
| Name             | The name of the Azure offer term, e.g., “Monetary Credit”.   |                                                                                                                                                                  
| ServiceRegion    | 所在的region  |
| Tags             | Provides additional meter data.“Third Party” indicates a meter with no discount.  Blanks indicate First Party.  |
|TieredDiscount   | 阶梯优惠|
| Unit             | 单位|




