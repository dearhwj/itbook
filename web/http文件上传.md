# HTTP文件上传
[一般处理程序上传文件（html表单上传、aspx页面上传）]("http://www.cnblogs.com/SkySoot/p/3525139.html")
 
 	form 表单需要设置 enctype="multipart/form-data" 属性，请求报文体中数据格式也由键值对更改为数据头和数具体，并有随机边界符分割。
 
[form 中Enctype=multipart/form-data 的作用]("http://zkliqiang.iteye.com/blog/779285")

	表单中enctype="multipart/form-data"的意思，是设置表单的MIME编码。默认情况，这个编码格式是application/x-www-form-urlencoded，不能用于文件上传；只有使用了multipart/form-data，才能完整的传递文件数据，进行下面的操作. 
	enctype="multipart/form-data"是上传二进制数据; form里面的input的值以2进制的方式传过去。 form里面的input的值以2进制的方式传过去，所以request就得不到值了。 也就是说加了这段代码,用request就会传递不成功,取表单值加入数据库时，用到下面的：