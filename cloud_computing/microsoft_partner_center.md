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


## 基本的领域模型
### Customer客户
客户信息有公司信息和Biling信息构成



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


创建客户的时候不用定义customerID(GUID)，response会把这个ID返回回来

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


1. 奇葩的方法设计居然只有一个参数一把取出来，也不弄个分页。
2. 返回的信息里面包含了客户的ID（微软是通过GUID生成的），也就是说把这个客户ID暴露出去问题也不大！


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


## Update a customer's billing profile
更新客户的billing profile. API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634718.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634718.aspx)

更新客户的profile信息，post的是一个很大的json字符串，看来是整个overwrite掉的。另外partner这边提供了更新客户billing profile的api，但没有提供更新客户company信息的api。billing profile包含了以下信息

```

{
    "id": "a58ceba5-60ac-48e4-a0bc-2a855811807a",
    "firstName": "FirstName",
    "lastName": "LastName",
    "email": "email@sample.com",
    "culture": "en-US",
    "language": "en",
    "companyName": "companyName",
    "defaultAddress": {
        "country": "US",
        "city": "Redmond",
        "state": "WA",
        "addressLine1": "One Microsoft Way",
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
根据客户的ID，获取客户的公司信息

原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634682.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634682.aspx)


### 返回信息
返回的信息包括公司名、地址、联系方式、以及客户信息的URL

```
{
    "tenantId": "4d3cf487-70f4-4e1e-9ff1-b2bfce8d9f04",
    "domain": "dtdemocspcustomer005.onmicrosoft.com",
    "companyName": "DT Demo CSP Customer 005",
    "address": {
        "country": "US",
        "region": "WA",
        "city": "Redmond ",
        "addressLine1": "1 Microsoft Way",
        "postalCode": "98052",
        "phoneNumber": "4155551212"
    },
    "email": "daniel@hotmail.com.tw",
    "links": {
        "self": {
            "uri": "/customers/4d3cf487-70f4-4e1e-9ff1-b2bfce8d9f04/profiles/company",
            "method": "GET",
            "headers": []
        }
    },
    "attributes": {
        "objectType": "CustomerCompanyProfile"
    }
}


```


## Create user accounts for a customer
创建一个客户账号（CustomerUser）。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725328.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725328.aspx)

###Request syntax
| Method |	Request URI |
| --- | --- |
|POST	| {baseURL}/v1/customers/{customer-tenant-id}/users HTTP/1.1|

```
POST https://api.partnercenter.microsoft.com/v1/customers/<customer-tenant-id>/users HTTP/1.1
Authorization: Bearer <token>
Accept: application/json
MS-RequestId: b1317092-f087-471e-a637-f66523b2b94c
MS-CorrelationId: 8a53b025-d5be-4d98-ab20-229d1813de76
{
      "usageLocation": "country/region code",
      "userPrincipalName": "userid@domain.onmicrosoft.com",
      "firstName": "First",
      "lastName": "Last",
      "displayName": "User name",   
      "passwordProfile":{
                 password: "abCD123*",
                 forceChangePassword: true
      },
      "attributes": {
        "objectType": "CustomerUser"
      }
}



```

1. 用的是HTTPS所以网络通信上可以确保安全！密码是明文传播的，可以要求forceChangePassword=true
2. 创建客户的时候不用定义ID(GUID)，response会把这个ID返回回来




## Update user accounts for a customer
更新customer的用户账号信息. API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt725337.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725337.aspx)

| Method    | Request URI                                                                                                                         
| ---- | --- |
| **PATCH** | {baseURL}/v1/customers/{customer-tenant-id}/users/<user-id> HTTP/1.1 |

1. 可以局部更新某些账号信息，只要提供需要修改的字段内容就行，response会返回全部的账号信息



## Get a user account by ID
根据客户账号ID获取账号信息。 API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt745139.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt745139.aspx)



| Method  | Request URI    |
| --- | --- |
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/users/{user-id} HTTP/1.1 |



## Get a list of all user accounts for a customer
获取用户所有的客户账号。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725330.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725330.aspx)

**Request syntax**

| Method  | Request URI  |                                                                                                              
| ------- | ---- |
**GET** | [{baseURL}/v1/customers/{customer-tenant-id}/users HTTP/1.1





## Delete a user account for a customer
删除一个客户账号(CustomerUser)，不是删除Customer。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725329.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725329.aspx)

**Request syntax**

| Method     | Request URI                                                                                                                                   
| --- | ---|
**DELETE** | {baseURL}/v1/customers/{customer-tenant-id}/users/{user-id} HTTP/1.1|



1. 微软的模型里面资源（Order、Subscription等等）都是挂在Customer下的，***微软的Partner Center没有提供删除Customer的API***,只有删除CustomerUser的API，删除CustomerUser是很简单的，只是删除客户的联系信息（参考Create user accounts for a customer）。
2. 删除客户需要指定客户ID（GUID），这个可以通过客户账号的查询接口获取。


## View deleted users for a customer
获取客户(Customer)下已经删除的用户账号.API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt744323.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt744323.aspx)

| Method  | Request URI        |
| --- | --- |
|**GET** | {baseURL}/v1/customers/{customer-tenant-id}/users? size={size}&filter={filter} HTTP/1.1

1. 这个其实是一个统一的用户账号查询接口。需要查询参数配合{"Field":"UserStatus","Value":"Inactive","Operator":"equals"}.


## Restore a deleted user for a customer
恢复一个已经删除的Customer User.
API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt744322.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt744322.aspx)


Method    | Request URI                                                                                                                                    
|--- | ---| 
|**PATCH** | _{baseURL}_/v1/customers/{customer-tenant-id}/users/{user-id}  HTTP/1.1|

1. delete用户的时候，用户状态变成inactive。保留30天，之后就不能恢复了！




## Get a list of available licenses
获取客户可用的订阅和许可证. API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725331.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725331.aspx)


**Request syntax**

| Method  | Request URI |                                                                                                                                  
| --- | --- |
| **GET** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/customers/{customer-tenant-id}/subscribedskus HTTP/1.1|


## Get user roles for a customer
获取用户(Customer)的角色信息。这是一组API，提供了以下几个API
1. 获取某个账号(CustomerAccount)的拥有的角色和权限
2. 获取客户（Customer）全部的角色
3. 获取指定角色的用户列表

API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt725334.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725334.aspx)

**Request syntax**

Method  | Request URI                                                                                                                                                  
| --- | --- |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/users/{user-id}/directoryroles HTTP/1.1 |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles HTTP/1.1 |               
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles/{role-ID}/usermembers  |


备注
1. 这个role 和权限怎么定义的呢？还没了解到



## Remove a customer user from a role
从角色中删除一个用户. API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt745131.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt745131.aspx)



Method     | Request URI                                                                                                                                                                  
| --- | --- | 
| **DELETE** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles/{role-ID}/usermembers/{user-ID} HTTP/1.1|




