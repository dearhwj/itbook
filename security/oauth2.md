# OAuth 2.0

## OAuth是什么东东
 OAuth 是Open Authorization简写


OAuth协议主要适用于 针对个人用户对资源的开放授权，比如Google的用户Alice。OAuth的特点是“现场授权”或“在线授权”：客户端主要通过浏览器去访问资源，授 权时需要认证Alice的资源所有者身份，并且需要Alice现场审批。OAuth一般在SNS服务中广泛使用，如微博。IAM服务则不同，它的特点是 “预先授权”或“离线授权”：客户端主要通过REST API方式去访问资源，资源所有者可以预先知道第三方应用所需要的资源请求，一次授权之后，很少会变更。IAM服务一般在云计算服务中使用，如AWS服 务、阿里云计算服务。


OAuth 2.0 是目前比较流行的做法，它率先被Google, Yahoo, Microsoft, Facebook等使用。之所以标注为 2.0，是因为最初有一个1.0协议，但这个1.0协议被弄得太复杂，易用性差，所以没有得到普及。2.0是一个新的设计，协议简单清晰，但它并不兼容 1.0，可以说与1.0没什么关系。所以，我就只介绍2.0。****



## OAuth2的验证流程

{% mermaid %}
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
{% endmermaid %}

## OAuth Provider实现


### 相关的API
#### OAuth2的authorize接口

示例:[http://open.weibo.com/wiki/Oauth2/authorize](http://open.weibo.com/wiki/Oauth2/authorize)

|参数名 |说明 |
| --- | --- |
|client_id|申请应用时分配的AppKey|
|redirect_uri |授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。|
|scope| 申请scope权限所需参数，可一次申请多个scope权限，用逗号分隔,其实就是一个业务字段|
|state|用于保持请求和回调的状态，在回调时，会在Query Parameter中回传该参数。开发者可以用这个参数验证请求有效性，也可以记录用户请求授权页前的位置。这个参数可用于防止跨站请求伪造（CSRF）攻击|
| display| 授权页面的终端类型，例如default ，mobile ，wap ，client ,apponweibo|

***注意***
这个里面有个关键点是认证服务器需要认证client_id 和 redirect_uri



WeiboX



https://api.weibo.com/oauth2/authorize?forcelogin=true&scope=all&client_id=83996567&response_type=code&redirect_uri=http%3A%2F%2Fweiboformac.sinaapp.com%2F_auth%2Fcallback.php






### 参考资料

[帮你深入理解OAuth2.0协议](http://blog.csdn.net/seccloud/article/details/8192707)

[理解OAuth 2.0](http://www.ruanyifeng.com/blog/2014/05/oauth_2_0.html)