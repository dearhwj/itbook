# Nginx

lua_package_path



[LUA require 搜索路径指定方法](http://blog.csdn.net/langeldep/article/details/8289199)o

[Lua中的异常处理pcall、xpcall、debug使用实例](http://www.jb51.net/article/55522.htm)

[ngx_lua模块进行web开发的常见问题解答](http://chaoslawful.iteye.com/blog/730463)

	 ngx_lua 中访问 NginX 内置变量 ngx.var.arg_PARAMETER 即可获得GET参数PARAMETER的内容。 
	 要获得完整的POST请求体数据，可以访问 NginX 内置变量 ngx.var.request_body（注意：由于 NginX 默认在处理请求前不自动读取 request body，所以目前必须显式借助 form-input-nginx 模块才能从该变量得到请求体，否则该变量内容始终为空！）。如果想获取 POST 方式提交的表单参数，还可以借助 form-input-nginx 模块省去解析过程


[nginx访问控制allow、deny（ngx_http_access_module）](https://www.ttlsa.com/linux/nginx-modules-ngx_http_access_module/)

	nginx访问控制模块要数nginx里面最简单的指令，只要记住你想禁止谁访问就deny加上IP，想允许则加上allow ip，想禁止或者允许所有，那么allow all或者deny all即可.