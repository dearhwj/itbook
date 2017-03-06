# Microsoft Azure Partner Center

## 基础
### Partner Center REST headers


合作伙伴REST请求头部信息

#### 请求参数
| Header                   | Description   | Value Type|
| --- | --- | ---|
| **Authorization:**       | Required. The authorization token in the form **Bearer** <token>.   | **string**|
| **Accept:**              | Specifies the request and response type, **"application/json"**.                                                                                                                                                                                                                                                                          | **string**
| **MS-RequestId:**        | A unique identifier for the call, used to ensure idempotency. In the case of a timeout, the retry call should include the same value. Upon receiving a response (success or business failure), the value should be reset for the next call.                                                                                               | **guid**  
| **MS-CorrelationId:**    | A unique identifier for the call, useful the logs and network traces for troubleshooting errors. The value should be reset for every call. All operations should include this header. For more information, see the Correlation ID information in [Test and debug](https://msdn.microsoft.com/en-us/library/partnercenter/mt634717.aspx). | **guid**  
| **MS-Contract-Version:** | Required. Specifies the version of the API requested; generally **api-version: v1** unless otherwise specified in the [Scenarios](https://msdn.microsoft.com/en-us/library/partnercenter/mt634715.aspx) section.                                                                                                                          | **string**
|**If-Match:**            | Used for concurrency control. Some API calls require passing the ETag via the **If-Match** header. The ETag is usually on the resource and therefore, requires **GET**-ting the latest. For more information, see the ETag information in [Test and debug](https://msdn.microsoft.com/en-us/library/partnercenter/mt634717.aspx).         | **string**
**X-Locale:**            | Optional. Specifies the language in which the rates are returned. Default is "en-US".                                                                                                                                                                                                                                                     | **string**

#### 总结
1. Bearer <token> 是基于oauth2的
2. MS-RequestId vs MS-CorrelationId 不同的地方在于MS-CorrelationId每次调用都是不同的


## 基本的领域模型
### Customer客户
客户信息有公司信息和Biling信息构成




## 客户管理
### Create a Customer(创建一个客户)

原文地址:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634668.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634668.aspx)
创建一个新的Customer，做为一个CSP Pantner，你可以代替这个Customer下单。这API也创建了以下内容：
1. 一个代表这个用户的Azure AD租户。
2. reseller和这个customer的关系，这个关系用来授权admin权限
3. 注册了一个User做为这个customer的admin用户




返回[Customer](https://msdn.microsoft.com/en-us/library/partnercenter/dn974947.aspx) 对象


创建客户的时候不用定义customerID(GUID)，response会把这个ID返回回来

### Request a reseller relationship
请求一个reseller关系

原文地址:[https://msdn.microsoft.com/en-us/library/partnercenter/mt712736.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt712736.aspx)

这个请求不会建立reseller和customer的关系，它只会返回一个签署合作伙伴协议的url，类似https://portal.office.com/partner/partnersignup.aspx?type=ResellerRelationship&id=3b33e682-00c3-41ee-9dd2-a548adf56438&csp=1&msppid=0。reseller需要把这个url给到客户，客户在页面上对这个进行确认操作。

参考[Request a relationship with a customer](https://msdn.microsoft.com/en-us/partner-center/request-a-relationship-with-a-customer) ，可以获得以下信息
1.  获取的这个URL是标志reseller身份的URL，不包含任何的客户信息，所以，这个URL可以发送给任意多个customer。
2. 客户的admin登录并确认这个邀请链接，协议生效
3. 客户可以删除合作伙伴的代理admin权限。删除以后，客户的账号和商业关系继续保留。如果客户需要帮助，合作伙伴必须call微软的客户支持来代替客户创建一个服务请求。


### Get a customer by ID


根据客户ID获取客户信息，返回的客户信息包括了客户的billing信息、company信息、以及和reseller的关系（reseller或none）

原文地址[https://msdn.microsoft.com/en-us/library/partnercenter/mt634680.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634680.aspx)

{baseURL}/v1/customers/{customer-tenant-id} HTTP/1.1

从参数的名称能看出来客户在微软的体系里面是一个租户的概念





### Get a list of customers

查询客户列表，不支持查询参数


| Method  | Request URI  |               
| --- | ---|
| **GET** | _{baseURL}_/v1/customers?size={size} HTTP/1.1


原文：[https://msdn.microsoft.com/en-us/library/partnercenter/mt634685.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634685.aspx)


1. 奇葩的方法设计居然只有一个参数一把取出来，也不弄个分页。
2. 返回的信息里面包含了客户的ID（微软是通过GUID生成的），也就是说把这个客户ID暴露出去问题也不大！


### Get a customer by company name or domain
查询客户信息。支持查询参数

原文[https://msdn.microsoft.com/en-us/library/partnercenter/mt634681.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634681.aspx)

这个地方从API的层面看不出来，filter参数到底支持哪几种过滤参数，难道是全支持，后面是一个搜索引擎吗？


### Get a customer's orders 
获取一个客户的所有订单，不支持查询参数

原文[https://msdn.microsoft.com/en-us/library/partnercenter/mt634671.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634671.aspx)

获取一个客户的全部订单,不支持查询参数

| Method  | Request URI |
| ---- | --- |
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/orders HTTP/1.1 |

1. 你能看到reseller是需要通过指定customerId来查询订单的，其实就是说订单还是归属到客户的，需要用客户ID进行查询路由
2. 同样是奇葩的设计一把取出客户所有的订单，不会爆吗？



### Get a customer's subscriptions
获取一个客户所有的subscription。Azure中Subscription被分为License based subscription和Usage based subscription

原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634673.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634673.aspx)

| Method  | Request URI  |
| ------- | --- |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/subscriptions HTTP/1.1|

### Update the nickname for a subscription
更新subscription的nickname，就是给客户的subscription取一个别名
原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634726.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634726.aspx)


### Get a customer's billing profile
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


###Update a customer's billing profile
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


### Get a customer's company profile
根据客户的ID，获取客户的公司信息

原文:[https://msdn.microsoft.com/en-us/library/partnercenter/mt634682.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634682.aspx)


返回信息
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


### Create user accounts for a customer
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




### Update user accounts for a customer
更新customer的用户账号信息. API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt725337.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725337.aspx)

| Method    | Request URI|
| ---- | --- |
| **PATCH** | {baseURL}/v1/customers/{customer-tenant-id}/users/<user-id> HTTP/1.1 |

1. 可以局部更新某些账号信息，只要提供需要修改的字段内容就行，response会返回全部的账号信息



### Get a user account by ID
根据客户账号ID获取账号信息。 API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt745139.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt745139.aspx)



| Method  | Request URI    |
| --- | --- |
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/users/{user-id} HTTP/1.1 |



### Get a list of all user accounts for a customer
获取用户所有的客户账号。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725330.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725330.aspx)

**Request syntax**

| Method  | Request URI | 
| ------- | ---- |
| **GET** | [{baseURL}/v1/customers/{customer-tenant-id}/users HTTP/1.1





### Delete a user account for a customer
删除一个客户账号(CustomerUser)，不是删除Customer。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725329.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725329.aspx)

**Request syntax**

| Method     | Request URI|
| --- | ---|
| **DELETE** | {baseURL}/v1/customers/{customer-tenant-id}/users/{user-id} HTTP/1.1|



1. 微软的模型里面资源（Order、Subscription等等）都是挂在Customer下的，***微软的Partner Center没有提供删除Customer的API***,只有删除CustomerUser的API，删除CustomerUser是很简单的，只是删除客户的联系信息（参考Create user accounts for a customer）。
2. 删除客户需要指定客户ID（GUID），这个可以通过客户账号的查询接口获取。


### View deleted users for a customer
获取客户(Customer)下已经删除的用户账号.API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt744323.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt744323.aspx)

| Method  | Request URI        |
| --- | --- |
|**GET** | {baseURL}/v1/customers/{customer-tenant-id}/users? size={size}&filter={filter} HTTP/1.1

1. 这个其实是一个统一的用户账号查询接口。需要查询参数配合{"Field":"UserStatus","Value":"Inactive","Operator":"equals"}.


### Restore a deleted user for a customer
恢复一个已经删除的Customer User.
API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt744322.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt744322.aspx)


| Method    | Request URI|
|--- | --- | 
|**PATCH** | _{baseURL}_/v1/customers/{customer-tenant-id}/users/{user-id}  HTTP/1.1|

1. delete用户的时候，用户状态变成inactive。保留30天，之后就不能恢复了！



### Get a list of available licenses
获取客户可用的订阅和许可证. API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt725331.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725331.aspx)


**Request syntax**

| Method  | Request URI |
| --- | --- |
| **GET** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/customers/{customer-tenant-id}/subscribedskus HTTP/1.1|


### Get user roles for a customer
获取用户(Customer)的角色信息。这是一组API，提供了以下几个API
1. 获取某个账号(CustomerAccount)的拥有的角色和权限
2. 获取客户（Customer）全部的角色
3. 获取指定角色的用户列表

API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt725334.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725334.aspx)

**Request syntax**

|Method  | Request URI|
| --- | --- |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/users/{user-id}/directoryroles HTTP/1.1 |
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles HTTP/1.1 |               
| **GET** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles/{role-ID}/usermembers  |


备注
1. 这个role 和权限怎么定义的呢？还没了解到



### Remove a customer user from a role
从角色中删除一个用户. API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt745131.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt745131.aspx)



|Method     | Request URI|
| --- | --- | 
| **DELETE** | {baseURL}/v1/customers/{customer-tenant-id}/directoryroles/{role-ID}/usermembers/{user-ID} HTTP/1.1|


### Set user roles for a customer
设置一个用户角色。API[https://msdn.microsoft.com/en-us/library/partnercenter/mt725336.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt725336.aspx)


| Method   | Request URI|
| --- | --- |
| **POST** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/customers/{customer-tenant-id}/directoryroles/{role-ID}/usermembers HTTP/1.1|

提交参数

Name                  | Type       | Required | Description                           
--------------------- | ---------- | -------- | --------------------------------------
**Id**                | **string** | Y        | The Id of the user to add to the role.
**DisplayName**       | **string** | Y        | The friendly display name of the user.
**UserPrincipalName** | **string** | Y        | The name of the user principal.       
**Attributes**        | **object** | Y        | Contains "ObjectType":"UserMember"   

## 订单管理

### Get a list of offer categories by market
获取指定country/region的offer category列表。API定义[https://msdn.microsoft.com/en-us/library/partnercenter/mt634689.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634689.aspx)


**Request syntax**

|Method  | Request URI|
| --- | --- |
| **GET** | {baseURL}/v1/offercategories?country={country-id} HTTP/1.1 |

Response example

返回的对象如下，对象没太多的内容.

```

{
    "totalCount": 4,
    "items": [{
        "id": "Enterprise_Key",
        "name": "Enterprise",
        "rank": 20,
        "locale": "en-us",
        "country": "US",
        "attributes": {
            "objectType": "OfferCategory"
        }
}        
```

### Get a list of offers for a market
获取market下的商品。


| Method  | Request URI|
| --- | --- |
|**GET** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/offers?country={country_id} HTTP/1.1 |


1. 返回的offer对象信息就比较多了. 包括了分类、产品、业务属性（是否自动续费、是否可购买）等信息


Response example

```
{
    "totalCount":12,"items":[{
        "id":"E60E0348-1710-484B-992A-32B294D4CDE1",
        "name":"Azure Rights Management Premium (Government Pricing)",
        "description":"Microsoft Azure Rights Management Premium helps you protect confidential documents and email with strong encryption.
                       Control the use of your information by specifying who can view, edit, print, save and share your data.
                       Simple to use and integrated with Microsoft Office, SharePoint and Exchange.",
        "minimumQuantity":1,
        "maximumQuantity":10000000,
        "rank":5,
        "uri":"/3c95518e-8c37-41e3-9627-0ca339200f53/Offers/E60E0348-1710-484B-992A-32B294D4CDE1",
        "locale":"EN-US",
        "country":"US",
        "category":{
            "id":"Government_Key",
            "name":"Government",
            "rank":40,
            "locale":"en-us",
            "country":"US",
            "attributes":{
                "objectType":"OfferCategory"
            }
        },
        "prerequisiteOffers":[],
        "isAddOn":false,
        "isAvailableForPurchase":true,
        "billing":"license",
        "isAutoRenewable":true,
        "product":{
            "id":"c52ea49f-fe5d-4e95-93ba-1de91d380f89",
            "name":"Azure Rights Management Premium",
            "unit":"Licenses"
        },
        "unitType":"Licenses",
        "links":{
            "learnMore":{
                "uri":"http://g.microsoftonline.com/0BXPS00en/0000",
                "method":"GET",
                "headers":[]
            },
            "self":{
                "uri":"/offers/E60E0348-1710-484B-992A-32B294D4CDE1",
                "method":"GET",
                "headers":[]
            }
        },
        "attributes":{
            "objectType":"Offer"
        }
    },
    "links":{
        "self":{
            "uri":"/v1/offers?country={country_id}",
            "method":"GET",
            "headers":[]
        },
        "previous":{
            "uri":"/v1/offers?country={country_id}",
            "method":"GET",
            "headers":[]
        }
    },
    "attributes":{
        "objectType":"Collection"
    }
}


```

这个接口设计的比较“冗余”，跟offer相关的product和category都会被关联输出

### Get an offer by ID 
跟据offerID获取offer信息。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634678.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634678.aspx)


| Method  | Request URI |
| --- | --- |
| **GET** | _{baseURL}_/v1/offers/{offer-id}?country={country-id} HTTP/1.1 | 


1. 返回的offer对象信息就比较多了. 包括了分类、产品、业务属性（是否自动续费、是否可购买）等信息
2. 获取offer也要求输入marketId，从API的设定来看，offer是强依赖market的


### Create an order
创建一个订单。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634667.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634667.aspx)

订单对象参考[https://msdn.microsoft.com/en-us/library/partnercenter/dn974958.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/dn974958.aspx)。 订单对象包含了订单行。订单行里面有商品ID


| Method | RequestURI| 
| ---- | ---- |
| **POST** | _{baseURL}_/v1/customers/{customer-tenant-id}/orders HTTP/1.1 |





```
POST https://api.partnercenter.microsoft.com/v1/customers/<customer-tenant-id>/orders HTTP/1.1
Authorization: Bearer <token> 
Accept: application/json
MS-RequestId: b2fa039a-329b-467c-9f91-a3831704d7ca
MS-CorrelationId: 17b21d24-f39e-4dbf-af44-f0c7fb7f55fb
Content-Type: application/json
Content-Length: 345
Expect: 100-continue

{
    "ReferenceCustomerId": "<customer-tenant-id>",
    "LineItems": [{
        "LineItemNumber": 0,
        "OfferId": "0CCA44D6-68E9-4762-94EE-31ECE98783B9",
        "FriendlyName": "Nickname",
        "Quantity": 1,
    }],
    "Attributes": {
        "ObjectType": "Order"
    }
}


```



### Get an order by ID
根据orderID获取Order。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634679.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634679.aspx)


**Request syntax**

| Method  | Request URI|
| --- | --- | 
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/orders/{id-for-order} HTTP/1.1 |


1. 从返回的订单创建日期来看2015-10-08T10:42:36.54-07:00 ，这个也不是标准的UTC时间！


### Purchase an add-on to a subscription
在subscription中购买附加项。从API的定义上理解就是对现有的order增加附加项。从demo来看，订阅和订单是多对1的。
实际上单个细的API是对订单进行操作的。

```
var subscriptionOperations = partnerOperations.Customers.ById(customerId).Subscriptions.ById(subscriptionId);
var parentSubscription = subscriptionOperations.Get();
var orderToUpdate = new Order()
{
    ReferenceCustomerId = customerId,
    LineItems = new List<OrderLineItem>()
    {
        new OrderLineItem()
        {
            LineItemNumber = 0,
            OfferId = addOnOfferId,
            FriendlyName = "Some friendly name",
            Quantity = 2,
            ParentSubscriptionId = subscriptionId
        }
    }
};
Order updatedOrder = partnerOperations.Customers.ById(customerId).Orders.ById(parentSubscription.OrderId).Patch(orderToUpdate);

```

API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt778903.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt778903.aspx)


**Request syntax**

| Method    | Request URI  |
|---- | ---- |
| **PATCH** | _{baseURL}_/v1/customers/{customer-tenant-id}/orders/{order-id} HTTP/1.1|

### Reactivate a suspended subscription
把一个暂停的订阅重新激活。 API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634714.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634714.aspx)


**Request syntax**

| Method    | Request URI                                                                    |
|--- | ----|
| **PATCH** | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{id-for-subscription}  HTTP/1.1|



1. 这个其实是一个通用的订阅PAPI，是直接调整了订阅的状态！


### Suspend a subscription
暂停客户订阅。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt634716.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt634716.aspx)

|Method    | Request URI|
|--- | --- |
| **PATCH** | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{id-for-subscription}  HTTP/1.1 |

```

PATCH https://api.partnercenter.microsoft.com/v1/customers/<customer-tenant-id>/subscriptions/<id-for-subscription> HTTP/1.1
Authorization: Bearer <token>
Accept: application/json
MS-RequestId: ca7c39f7-1a80-43bc-90d8-ee7d1cad3831
MS-CorrelationId: ec8f62e5-1d92-47e9-8d5d-1924af105f2c
If-Match: <etag>
Content-Type: application/json
Content-Length: 1029
Expect: 100-continue
Connection: Keep-Alive

{
    "Id": "83ef9d05-4169-4ef9-9657-0e86b1eab1de",
    "FriendlyName": "nickname",
    "Quantity": 2,
    "UnitType": "none",
    "ParentSubscriptionId": null,
    "CreationDate": "2015-11-25T06:41:12Z",
    "EffectiveStartDate": "2015-11-24T08:00:00Z",
    "CommitmentEndDate": "2016-12-12T08:00:00Z",
    "Status": "suspended",
    "AutoRenewEnabled": false,
    "BillingType": "none",
    "PartnerId": null,
    "ContractType": "subscription",
    "OrderId": "6183db3d-6318-4e52-877e-25806e4971be",
    "Attributes": {
        "Etag": "<etag>",
        "ObjectType": "Subscription"
    }
}


```

1. 调用这个api的时候，需要提供OrderId。 


### Transition a subscription
升级客户的订阅到特定的目标订阅。先要获取客户现有的订阅，然后把需要升级的订阅再进行升级！API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt644395.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt644395.aspx)

**Request syntax**

|Method   | Request URI   |
| ---- | ---- |
| **GET**  | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{id-for-subscription}/upgrades HTTP/1.1 |
| **POST** | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{id-for-target}/upgrades HTTP/1.1      |

```

GET https://api.partnercenter.microsoft.com/v1/customers/{customer-tenant-id}/subscriptions/{id-for-subscription}/upgrades HTTP/1.1
Authorization: Bearer <token>
Accept: application/json
MS-RequestId: 18752a69-1aa1-4ef7-8f9d-eb3681b2d70a
MS-CorrelationId: 81b08ffe-4cf8-49cd-82db-5c2fb0a8e132
X-Locale: en-US

POST https://api.partnercenter.microsoft.com/v1/customers/{customer-tenant-id}/subscriptions/{id-for-target}/upgrades HTTP/1.1
Authorization: Bearer <token>
Accept: application/json
MS-RequestId: 750fd5ea-904b-4c3e-b476-60d0feacab0d
MS-CorrelationId: 81b08ffe-4cf8-49cd-82db-5c2fb0a8e132
X-Locale: en-US
Content-Type: application/json
Content-Length: 1098
Expect: 100-continue

{
    "TargetOffer":{
        "Id":"796B6B5F-613C-4E24-A17C-EBA730D49C02",
        "Name":"Office 365 Enterprise E3",
        "Description":"The best plan for businesses that need full productivity, communication and collaboration tools with the familiar Office suite, including Office Online.",
        "MinimumQuantity":1,
        "MaximumQuantity":10000000,
        "Rank":61,
        "Uri":"/3c95518e-8c37-41e3-9627-0ca339200f53/Offers/796B6B5F-613C-4E24-A17C-EBA730D49C02",
        "Locale":"en-us",
        "Country":"US",
        "Category":{
            "Id":"Enterprise_Key",
            "Name":"Enterprise",
            "Rank":20,
            "Locale":"en-us",
            "Country":"US",
            "Attributes":{
                "ObjectType":"OfferCategory"
            }
        },
        "PrerequisiteOffers":[],
        "IsAddOn":false,
        "IsAvailableForPurchase":true,
        "Billing":"license",
        "IsAutoRenewable":true,
        "Product":{
            "Id":"6fd2c87f-b296-42f0-b197-1e91e994b900",
            "Name":"Office 365 Enterprise E3",
            "Unit":"Licenses"
        },
        "UnitType":"Licenses",
        "Links":{
            "LearnMore":{
                "Uri":"http://g.microsoftonline.com/0BXPS00en/1015",
                "Method":"GET",
                "Headers":[]
            }
        }
        "Attributes":{
            "ObjectType":"Offer"
        }
    },
    "UpgradeType":1,
    "IsEligible":true,
    "Quantity":1,
    "UpgradeErrors":[],
    "Attributes":{
        "ObjectType":"Upgrade"
    }
}

```


**Response**

```

HTTP/1.1 200 OK
Content-Length: 138
Content-Type: application/json
MS-CorrelationId: 81b08ffe-4cf8-49cd-82db-5c2fb0a8e132
MS-RequestId: 18752a69-1aa1-4ef7-8f9d-eb3681b2d70a
Date: Fri, 29 Jan 2016 20:42:26 GMT

{
    "totalCount": 1,
    "items": [{
        "targetOffer": {
            "id": "91FD106F-4B2C-4938-95AC-F54F74E9A239",
            "name": "Office 365 Enterprise E1",
            "description": "For businesses that need communication and collaboration tools and the ability to read and do lightweight editing of documents with Office Online.",
            "minimumQuantity": 1,
            "maximumQuantity": 10000000,
            "rank": 48,
            "uri": "/3c95518e-8c37-41e3-9627-0ca339200f53/Offers/91FD106F-4B2C-4938-95AC-F54F74E9A239",
            "locale": "en-us",
            "country": "US",
            "category": {
                "id": "Enterprise_Key",
                "name": "Enterprise",
                "rank": 20,
                "locale": "en-us",
                "country": "US",
                "attributes": {
                    "objectType": "OfferCategory"
                }
            },
            "prerequisiteOffers": [],
            "isAddOn": false,
            "isAvailableForPurchase": true,
            "billing": "license",
            "isAutoRenewable": true,
            "isInternal": false,
            "conversionTargetOffers": [],
            "partnerQualifications": ["none"],
            "product": {
                "id": "18181a46-0d4e-45cd-891e-60aabd171b4e",
                "name": "Office 365 Enterprise E1",
                "unit": "Licenses"
            },
            "unitType": "Licenses",
            "links": {
                "learnMore": {
                    "uri": "http://g.microsoftonline.com/0BXPS00en/1013",
                    "method": "GET",
                    "headers": []
                },
                "self": {
                    "uri": "/offers/91FD106F-4B2C-4938-95AC-F54F74E9A239?country=US",
                    "method": "GET",
                    "headers": []
                }
            },
            "attributes": {
                "objectType": "Offer"
            }
        },
        "upgradeType": "upgrade_only",
        "isEligible": false,
        "quantity": 1,
        "upgradeErrors": [{
            "code": 2,
            "description": "Subscription cannot be upgraded because the source subscription state is not active.  Additional Details contains the current source subscription state.",
            "attributes": {
                "objectType": "UpgradeError"
            }
        }],
        "attributes": {
            "objectType": "Upgrade"
        }
    }],
    "attributes": {
        "objectType": "Collection"
    }
}

HTTP/1.1 200 OK
Content-Length: 448
Content-Type: application/json
MS-CorrelationId: 81b08ffe-4cf8-49cd-82db-5c2fb0a8e132
MS-RequestId: 750fd5ea-904b-4c3e-b476-60d0feacab0d
MS-CV: RnK86LBbDkWP/w2R.0
MS-ServerId: 102031201
Date: Fri, 29 Jan 2016 20:44:21 GMT

{
    "sourceSubscriptionId":"896a2862-67e2-4f3d-bb3f-c50c42b5fad8",
    "targetSubscriptionId":"2add8a55-454a-4ae5-a4c9-5107dc6e9768",
    "upgradeType":1,
    "upgradeErrors":[],
    "licenseErrors":[],
    "attributes":{
        "objectType":"UpgradeResult"
    }
}


```

1. 请求挺复杂的，需要把之前的订阅取出来，然后更想是购买一个新的offer。通过demo没看出来原来的那个订阅如何处理？原来的服务退掉，新的服务启用，金额补差价？



### Get prices for Microsoft Azure
获取Azure的价格。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt774619.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt774619.aspx)

**Request syntax**

| Method  | Request URI   |
| ---- | --- |
| **GET** | _{baseURL}_/v1/ratecards/azure&currency={currency}&region={region} |



**URI parameters** 

| Name         | Type      |  Required |  Description|
| --- | --- | --- | --- |
|**currency** | **string** | No        | Optional three letter ISO code for the currency in which the resource rates will be provided (e.g. "EUR"). The default is the currency associated with the market in the partner profile. |
|**region**   | **string** | No        | Optional two-letter ISO country/region code that indicates the market where the offer is purchased (e.g. "FR"). The default is the country/region code set in the partner profile.|


1. 通过这个接口可以获取指定market下的商品。或者跟合作伙伴绑定的。
2. 这个接口不支持商品版本

## 账单管理

### Get a collection of invoices
获取合作伙伴的发票。 [https://msdn.microsoft.com/en-us/library/partnercenter/mt712730.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt712730.aspx)


**Request syntax**

| Method  | Request URI     |
| --- | ---- |
| **GET** | _{baseURL}_/v1/invoices HTTP/1.1 |


### Get invoice line items
获取发票内容。API地址[https://msdn.microsoft.com/en-us/library/partnercenter/mt712733.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt712733.aspx)

**Request syntax**

Use the first syntax to return a full list of every line item for the given invoice. For large invoices, use the second syntax with a specified size and 0-based offset to return a paged list of line items.

|Method  | Request URI|
|--- | --- |
| **GET** | _{baseURL}_/v1/invoices/{invoice-id}/lineitems/{billing-provider}/{invoice-line-item-type} HTTP/1.1 |
|**GET** | _{baseURL}_/v1/invoices/{invoice-id}/lineitems/{billing-provider}/{invoice-line-item-type}?size={size}&offset=0 HTTP/1.1|


### Get invoice by ID

根据ID获取发票信息

**Request syntax**

| Method  | Request URI|
| ------ | ----|
| **GET** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/invoices/{invoice-id} HTTP/1.1



### Get a customer's utilization records for Azure
API文档 [https://msdn.microsoft.com/en-us/library/partnercenter/mt791774.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt791774.aspx)


**Request syntax**

| Method  | Request URI |
| ---- | ---- | 
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{subscription-id}/utilizations/azure?start_time={start-time}&end_time={end-time}&granularity={granularity}&show_details={True|False}&size={page-size} |


1. azure的reseller api  ，没有提供statement的能力给reseller ，只提供了客户的计量和询价的服务给reseller ，就是说reseller需要自己取到客户的计量数据 自己去批价，算出钱


### Get a subscription's resource usage information
根据客户订阅获取订阅相关的使用信息。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt651646.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt651646.aspx)

**Request syntax**

|Method  | Request URI|
| ------- | ------ |
| **GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/subscriptions/{id-for-subscription}/usagerecords/resources HTTP/1.1|


### Get usage summary for all of a customer's subscriptions
获取当前计费周期里面的客户的Azure服务使用。API地址[https://msdn.microsoft.com/en-us/library/partnercenter/mt651643.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt651643.aspx)

**Request syntax**

|Method  | Request URI|
|------- | ----- |
|**GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/usagesummary HTTP/1.1|


### Get the reseller's current account balance

获取reseller当前的账户余额。API文档[https://msdn.microsoft.com/en-us/library/partnercenter/mt712732.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt712732.aspx)


**Request syntax**

| Method  | Request URI|
| ------- | ---|
|**GET** | _{baseURL}_/v1/invoices/summary HTTP/1.1 |


## Provide support（服务支持）


### Get the managed services for a customer by ID

获取用户的管理服务信息。换句话说，获取你所有有代理和admin权限的订阅，reseller可以依据这些链接提供支持。API文档地址[https://msdn.microsoft.com/en-us/library/partnercenter/mt614220.aspx](https://msdn.microsoft.com/en-us/library/partnercenter/mt614220.aspx)

**Request syntax**

| Method  | Request URI |
| ---- | ---- |
|**GET** | [_{baseURL}_](https://msdn.microsoft.com/en-us/library/partnercenter/mt490977.aspx)/v1/customers/{customer-tenant-id}/managedservices HTTP/1.1 |


### Create a service request
为客户创建一个服务需求。这个意思就是以客户的名义创建工单！

| Method   | Request URI|
| ---- | --- |
| **POST** | _{baseURL}_/v1/servicerequests/{agent-locale} HTTP/1.1 |


**Request body**

请求参数.

|Name             | Type      |   Required | Description|
|---------------- | -------------------------- | -------- | --- |
|Title            | string                                                                                                                        | Y        | The service request title.|
|Description      | string                                                                                                                        | Y        | The description.|
|Severity         | string                                                                                                                        | Y        | The severity: "unknown", "critical", "moderate", or "minimal".|
|SupportTopicId   | string                                                                                                                        | Y        | The id of the support topic.|
|SupportTopicName | string                                                                                                                        | N        | The name of the support topic.|
|Id               | string                                                                                                                        | N        | The id of the service request.|
|Status           | string                                                                                                                        | N        | The status of the service request: "none", "open", "closed", or "attention_needed".|
|Organization     | [ServiceRequestOrganization](https://msdn.microsoft.com/en-us/library/partnercenter/mt734227.aspx#ServiceRequestOrganization) | N        | Organization for which the service request is created.|
|PrimaryContact   | [ServiceRequestContact](https://msdn.microsoft.com/en-us/library/partnercenter/mt734227.aspx#ServiceRequestContact)           | N        | Primary Contact on the service request.|
|LastUpdatedBy    | [ServiceRequestContact](https://msdn.microsoft.com/en-us/library/partnercenter/mt734227.aspx#ServiceRequestContact)           | N        |  "Last Updated By" contact for changes to the service request.
|ProductName      | string                                                                                                                        | N        | The name of the product that corresponds to the service request.
|ProductId        | string                                                                                                                        | N        | The id of the product.
|CreatedDate      | date                                                                                                                          | N        | The date of the service request's creation.
|LastModifiedDate | date                                                                                                                          | N        | The date that the service request was last modified.
|LastClosedDate   | date                                                                                                                          | N        | The date that the service request was last closed.
|FileLinks        | array of [FileInfo](https://msdn.microsoft.com/en-us/library/partnercenter/mt735172.aspx#FileInfo) resources                  | N        | The collection of File Links that pertain to the service request.
|NewNote          | [ServiceRequestNote](https://msdn.microsoft.com/en-us/library/partnercenter/mt734227.aspx#ServiceRequestNote)                 | N        | A note can be added to an existing service request.|
|Notes            | array of [ServiceRequestNotes](https://msdn.microsoft.com/en-us/library/partnercenter/mt734227.aspx#ServiceRequestNote)       | N        | A collection of notes added to the service request.|
|CountryCode      | string                                                                                                                        | N        | The country corresponding to the service request.|
|Attributes       | object                                                                                                                        | N        | Contains "ObjectType": "ServiceRequest".|


1. 这个地方是提工单必须有提供服务的地点（agent-locale），那如何解决工单垮区域流转的问题？

### Get service request support topics

获取服务请求的topic。


|Method  | Request URI|
| ---- | --- |
|**GET** | _{baseURL}_/v1/servicerequests/supporttopics HTTP/1.1|



### Get all service requests for a customer

获取客户所有的服务请求

|Method  | Request URI|
|------- | ---- |
|**GET** | _{baseURL}_/v1/customers/{customer-tenant-id}/servicerequests HTTP/1.1 |


返回结果

```
{
    "totalCount": 1,
    "items": [{
        "title": "Test",
        "severity": 0,
        "id": "615112491169010",
        "status": 1,
        "primaryContact": {
            "lastName": "LastName",
            "firstName": "FirstName"
        },
        "createdDate": "2015-11-24T01:07:00.863",
        "lastModifiedDate": "2015-11-24T01:17:10.61",
        "lastClosedDate": "0001-01-01T00:00:00",
        "attributes": {
            "objectType": "ServiceRequest"
        }
    }],
    "attributes": {
        "objectType": "Collection"
    }
}


```

1. 从返回的结果来看，并没有返回全部的服务请求的全部内容


### Update a service request
更新服务请求。

**Request syntax**

| Method    | Request URI|         
| --------- | ----- |
| **PATCH** | _{baseURL}_]/v1/servicerequests/{servicerequest-id} HTTP/1.1|



