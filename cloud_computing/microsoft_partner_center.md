# Microsoft Azure Partner Center

## 基础
### Partner Center REST headers


合作伙伴REST请求头部信息

#### 请求参数
| Header                   | Description   | Value Type|
| --- | --- | ---|
| **Authorization:**       | Required. The authorization token in the form **Bearer** <token>.   | **string**|
**Accept:**              | Specifies the request and response type, **"application/json"**.                                                                                                                                                                                                                                                                          | **string**
**MS-RequestId:**        | A unique identifier for the call, used to ensure idempotency. In the case of a timeout, the retry call should include the same value. Upon receiving a response (success or business failure), the value should be reset for the next call.                                                                                               | **guid**  
**MS-CorrelationId:**    | A unique identifier for the call, useful the logs and network traces for troubleshooting errors. The value should be reset for every call. All operations should include this header. For more information, see the Correlation ID information in [Test and debug](https://msdn.microsoft.com/en-us/library/partnercenter/mt634717.aspx). | **guid**  
**MS-Contract-Version:** | Required. Specifies the version of the API requested; generally **api-version: v1** unless otherwise specified in the [Scenarios](https://msdn.microsoft.com/en-us/library/partnercenter/mt634715.aspx) section.                                                                                                                          | **string**
**If-Match:**            | Used for concurrency control. Some API calls require passing the ETag via the **If-Match** header. The ETag is usually on the resource and therefore, requires **GET**-ting the latest. For more information, see the ETag information in [Test and debug](https://msdn.microsoft.com/en-us/library/partnercenter/mt634717.aspx).         | **string**
**X-Locale:**            | Optional. Specifies the language in which the rates are returned. Default is "en-US".                                                                                                                                                                                                                                                     | **string**

#### 总结
1. Bearer <token> 是基于oauth2的
2. MS-RequestId vs MS-CorrelationId 不同的地方在于MS-CorrelationId每次调用都是不同的



## Create a Customer(创建一个客户)

原文地址:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634668.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634668.aspx)
创建一个新的Customer，做为一个CSP Pantner，你可以代替这个Customer下单。这API也创建了以下内容：
1. 一个代表这个用户的Azure AD租户。
2. reseller和这个customer的关系，这个关系用来授权admin权限
3. 注册了一个User做为这个customer的admin用户


### 入参

|参数|说明|
| --- | --- |
| BillingProfile | billing相关的profile|
| CompanyProfile|公司相关的profile|


### 返回

返回[Customer](https://msdn.microsoft.com/en-us/library/partnercenter/dn974947.aspx) 对象



## Request a reseller relationship
请求一个reseller关系

原文地址:[https://msdn.microsoft.com/en-us/library/partnercenter/mt712736.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt712736.aspx)

这个请求不会建立reseller和customer的关系，它只会返回一个签署合作伙伴协议的url，类似https://portal.office.com/partner/partnersignup.aspx?type=ResellerRelationship&id=3b33e682-00c3-41ee-9dd2-a548adf56438&csp=1&msppid=0。reseller需要把这个url给到客户，客户在页面上对这个进行确认操作。

参考[Request a relationship with a customer](https://msdn.microsoft.com/en-us/partner-center/request-a-relationship-with-a-customer) ，可以获得以下信息
1.  获取的这个URL是标志reseller身份的URL，不包含任何的客户信息，所以，这个URL可以发送给任意多个customer。
2. 客户的admin登录并确认这个邀请链接，协议生效
3. 客户可以删除合作伙伴的代理admin权限。删除以后，客户的账号和商业关系继续保留。如果客户需要帮助，合作伙伴必须call微软的客户支持来代替客户创建一个服务请求。


## Get a customer by ID


根据客户ID获取客户信息，返回的客户信息包括了客户的billing信息、company信息、以及和reseller的关系（reseller或none）

原文地址[https://msdn.microsoft.com/en-us/library/partnercenter/mt634680.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634680.aspx)

{baseURL}/v1/customers/{customer-tenant-id} HTTP/1.1

从参数的名称能看出来客户在微软的体系里面是一个租户的概念





## Get a list of customers

查询客户列表，不支持查询参数


| Method  | Request URI  |               
| --- | ---|
**GET** | _{baseURL}_/v1/customers?size={size} HTTP/1.1


原文：[https://msdn.microsoft.com/en-us/library/partnercenter/mt634685.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634685.aspx)

奇葩的方法设计居然只有一个参数一把取出来，也不弄个分页


## Get a customer by company name or domain
查询客户信息。支持查询参数

原文[https://msdn.microsoft.com/en-us/library/partnercenter/mt634681.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634681.aspx)

这个地方从API的层面看不出来，filter参数到底支持哪几种过滤参数，难道是全支持，后面是一个搜索引擎吗？


## Get a customer's orders 
获取一个客户的所有订单，不支持查询参数

原文[https://msdn.microsoft.com/en-us/library/partnercenter/mt634671.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634671.aspx)

获取一个客户的全部订单,不支持查询参数

| Method  | Request URI |
| ---- | --- |
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/orders HTTP/1.1 |

1. 你能看到reseller是需要通过指定customerId来查询订单的，其实就是说订单还是归属到客户的，需要用客户ID进行查询路由
2. 同样是奇葩的设计一把取出客户所有的订单，不会爆吗？



## Get a customer's subscriptions
获取一个客户所有的subscription。Azure中Subscription被分为License based subscription和Usage based subscription

原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634673.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634673.aspx)

| Method  | Request URI  |                                                                                                                               
| ------- | --- |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/subscriptions HTTP/1.1|

## Update the nickname for a subscription
更新subscription的nickname，就是给客户的subscription取一个别名
原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634726.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634726.aspx)


## Get a customer's billing profile
获取一个客户的billing信息。

原文：[https://msdn.microsoft.com/en-us/library/partnercenter/mt634670.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634670.aspx)

```
{
    "id": "<billing-profile-id>",
    "firstName": "FirstName",
    "lastName": "LastName",
    "email": "email@sample.com",
    "culture": "en-US",
    "language": "en",
    "companyName": "CompanyName",
    "defaultAddress": {
        "country": "US",
        "city": "Redmond",
        "state": "WA",
        "addressLine1": "1 Microsoft Way",
        "postalCode": "98052",
        "firstName": "FirstName",
        "lastName": "LastName",
        "phoneNumber": "4255555555"
    },
    "links": {
        "self": {
            "uri": "/v1/customers/<customer-tenant-id>/profiles/billing",
            "method": "GET",
            "headers": []
        }
    },
    "attributes": {
        "etag": "<etag>",
        "objectType": "CustomerBillingProfile"
    }
}


```


## Get a customer's company profile
获取