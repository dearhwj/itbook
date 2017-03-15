# 翻译：The Web API Checklist
原文地址:[https://mathieu.fenniak.net/the-api-checklist/](https://mathieu.fenniak.net/the-api-checklist/)

## HTTP
1. Idempotent methods – GET, HEAD, PUT, DELETE, OPTIONS and TRACE 都支持幂等性
2. 身份验证-绝大多数API都需要身份验证
3. 201 Created – 请求已经成功处理。
4. 202 Accepted -请求是正确的，并且接下来会处理，但还没有处理完成。这个通常是指需要后台队列处理的情况
5. 错误代码4xx和5xx。4XX错误主要指的是客户端的错误，5XX主要指的是服务端的错误，这个可以有效地定位问题出在哪个环节
6. 410 Gone ——表示资源已经失效（已经被删除、归档、过期）
7. Expect: 100-Continue
8. Connection Keep-Alive –web服务器应该保持Keep-Alive已提升性能
9. HTTP Compression-HTTP压缩已提升性能
10. HTTP Caching—HTTP缓存。在API的响应头里面提供Cache-Control，如果不支持缓存，再头部返回“Cache-Control: no-cache”  
11. Cache Validation—如果API支持缓存，就应该在响应头里面提供Last-Modified 和ETag，并且支持If-Modified-Since 或者 If-None-Match。这样允许客户端检查缓存的版本是不是有效。
12. Conditional Modifications
13. Absolute Redirects -HTTP重定向响应返回绝对地址能提供更广的兼容性。
14. Link Response Header。RESTFUL API里面经常需要提供到其他资源的链接，即便你的响应没有自然的方法来提供链接例如PDF或Image
15. Canonical URLs-对于有多个URL的资源提供Canonical URL
16. Chunked Transfer Encoding.
17. Error Handling in Chunked Transfer Encoding
18. X-HTTP-Method-Override：如果HTTP Client只能支持GET/POST，就在HEAD中增加X-HTTP-Method-Override，把对应的方法设置成争取的方法
19. URL Length-如果你的API支持类似GET请求参数的复杂的或任意的过滤选项参数，记得如果URL的长度>2000客户端和服务端的兼容性可能都有问题

## API Design
20. Statelessness-无状态
21. Content Negotiation-内容协商。如果你想支持资源的多种表达形式，你能使用内容协商，比如accept头或者不同的URL(例如?format=json)
22. URI Templates -[URI Templates](http://tools.ietf.org/html/rfc6570)向客户端提供URL组合能力,或者说明你的URL访问模式给你的最终用户
23. Design for Intent-面向内部设计。不要只是通过API暴露你内部业务对象。设计API要有语义，而且满足用户的使用场景。
24. Versioning-API支持版本
25. Authorization-授权
26. Bulk Operations-支持批量操作
27. Pagination-支持分页。
28. Unicode-URL里支持Unicode
29. Error Logging-可以把客户输入导致的错误和系统导致的错误输出到两个不同的文件中。