# RPC/HTTP/RESTFULL调用返回错误规范(寻求意见版)

## 目前错误码方案遇到的问题
1. 错误码无法字典化。举例来说，入参缺少客户ID。通过message错误“uid is required”。这样的方式调用方无法通过编程的方案进行解析。
2. 错误码解析的编程量比较大。每个参数和错误类型的组合会导致大量的错误码定义。如果没有统一的错误码规则,客户端的解析成本很大，需要挨个翻译
2. 无法有效区分是服务端的错误还是客户端输入的错误。

## 基本定义
返回值对象基础属性如下

* status(必选)
* code（必选）
* errors(可选)
* message(必选)
* document(可选)



## status说明
status表示调用的状态值，2XX表示服务成功，4XX表示客户端错误，5XX表示服务端错误

* 200:成功
* 400:参数不合法
* 401：没权限
* 403：Forbidden
* 404：想操作的记录不存在
* 406：传入的格式不正确（比如用户请求JSON格式，但是只有XML格式）
* 503：ServiceUnavailable
* 500:InternalError


## code说明
Code 表示调用错误的信息，用于调用方跟据Code做翻译。

Code的构成：${错误类型}.${相关的字段}.${可选说明，写合法规则建议，不要写错误原因，错误原因枚举不完}

常用的错误有几类：

* 必要的参数没有(MissingParameter)
* 传入参数的格式不合法(InvalidParameter)
* 其他(请大家帮忙补充)

例如:UID是查询的必要参数，数据类型需要是Long:

* 没有输入UID的错误码是 MissingParameter.Uid
* 入参不合法: InvalidParameter.Uid
* 用户ID格式正确但不用户不存在:InvalidParameter.Uid.NotExist

例如: 传入的查询时间startTime和endTime；startTime要<endTime

* 传入的entTime小于了startTime：InvalidParameter.endTime.startTimeLessThanendTime

对于批量错误的情况可以使用errors进一步说明每个错误，code可以反馈比较大的错误Code，例如InvalidParameter、MissingParameter。

## errors说明
errors用于一次请求里面多个错误需要返回的情况，例如提交表单验证以后对多个表单字段进行验证，逐一返回错误原因。该参数可选。

errors是一个数组或者list，每一项表示一个错误。每一项包含以下几个字段filed、code、ducoment。

field：错误相关的字段名
code：错误相关的code，参考***code说明*** 里面的错误类型
document:相关错误的说明文档

```
"errors": [
    {
      "field": "title",
      "code": "missing_field"
      "documentation":"http://url"
    }
   ]
```



## message说明
体现问题的文字描述，用于提示问题的原因。建议用英文。该参数可选。

## document说明
用于指定相关问题的参考文档。该参数可选。


## 用例说明

成功

```
{
	"status":200,
	"message":"success";
}

```

参数错误

```
{
	"status":400,
	"code": "Invalid.Uid.MustBePositiveLong"
	"message":"uid is illegal";
}


```



