# 解决provisional headers are shown的过程

[原文地址:http://blog.xinshangshangxin.com/2015/04/20/%E8%A7%A3%E5%86%B3provisional-headers-are-shown%E7%9A%84%E8%BF%87%E7%A8%8B/](http://blog.xinshangshangxin.com/2015/04/20/%E8%A7%A3%E5%86%B3provisional-headers-are-shown%E7%9A%84%E8%BF%87%E7%A8%8B/)


	之所以会出现这个警告，是因为去获取该资源的请求其实并（还）没有真的发生，所以 Header 里显示的是伪信息，直到服务器真的有响应返回，这里的 Header 信息才会被更新为真实的。不过这一切也可能不会发生，因为该请求可能会被屏蔽。比如说 AdBlock 什么的，当然了不全是浏览器扩展，具体情况具体分析了