# RESTFUL API HTTP STATUS CODE整理

## HTTP状态码
|状态码|含义|备注|
|---|---|---|
|200| OK|  [GET]：服务器成功返回用户请求的数据，该操作是幂等的（Idempotent）|
|201 |CREATED|  [POST/PUT/PATCH]：用户新建或修改数据成功|
|202 |Accepted|  [*]：表示一个请求已经进入后台排队（异步任务）
|204 |NO CONTENT| [DELETE]：用户删除数据成功|
|400 |INVALID REQUEST | [POST/PUT/PATCH]：用户发出的请求有错误，服务器没有进行新建或修改数据的操作，该操作是幂等的|
|401 |Unauthorized | [*]：表示用户没有权限（令牌、用户名、密码错误）|
|403 |Forbidden | [*] 表示用户得到授权（与401错误相对），但是访问是被禁止的|
|404 |NOT FOUND | [*]：用户发出的请求针对的是不存在的记录，服务器没有进行操作，该操作是幂等的|
|406 |Not Acceptable | [GET]：用户请求的格式不可得（比如用户请求JSON格式，但是只有XML格式）|
|410 |Gone |[GET]：用户请求的资源被永久删除，且不会再得到的|
|422 |Unprocesable entity | [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误|
|500 |INTERNAL SERVER ERROR | [*]：服务器发生错误，用户将无法判断发出的请求是否成功|


## 错误处理（Error handling）
相对于HTTP STATUS Code，错误处理就没有统一的格式了。

### GitHub API错误处理
GitHub API的错误信息是会增加message和errors

```
HTTP/1.1 422 Unprocessable Entity
Content-Length: 149
{
  "message": "Validation Failed",
  "errors": [
    {
      "resource": "Issue",
      "field": "title",
      "code": "missing_field"
      "documentation_url":"http://url"
    }
  ]
}

```

Code的定义如下

|Error Name   | Description|
| ----- | --- |
| `missing`        | This means a resource does not exist. |                                     |
|`missing_field`  | This means a required field on a resource has not been set.|
|`invalid`        | This means the formatting of a field is invalid.  The documentation for that resource should be able to give you more specific information.|      
|`already_exists` | This means another resource has the same value as this field.  This can happen in resources that must have some unique key (such as Label names).|

多数的error会有一个对应的document_url来说明错误的文档地址

### Aliyun ECS Open API错误处理

Aliyun ECS Open API会在返回体中有一个Code字段表示对于的错误码

```
{
    "RequestId": "8906582E-6722-409A-A6C4-0E7863B733A5",
    "HostId": "ecs.aliyuncs.com",
    "Code": "InvalidOwnerId",
    "Message": "The specified OwnerId is not valid."
}
```


比较一下Github和Aliyun Ecs Open API可以看到这个GitHub错误码设计的比较灵活

## 参考资料
[GitHub API](https://developer.github.com/v3/)
[HTTP Status Codes](https://httpstatuses.com/)
[https://tools.ietf.org/html/rfc7231#section-6](https://tools.ietf.org/html/rfc7231#section-6)


