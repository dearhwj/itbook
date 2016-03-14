# Postman

[Postman 文档](https://www.getpostman.com/docs/)

[关闭postman中 form-data、x-www-form-urlencoded、raw、binary的区别](http://blog.csdn.net/ye1992/article/details/49998511)
	
	form-data: 就是http请求中的multipart/form-data,它会将表单的数据处理为一条消息，以标签为单元，用分隔符分开。既可以上传键值对，也可以上传文件。当上传的字段是文件时，会有Content-Type来表名文件类型；content-disposition，用来说明字段的一些信息；
	由于有boundary隔离，所以multipart/form-data既可以上传文件，也可以上传键值对，它采用了键值对的方式，所以可以上传多个文件。
	
	x-www-form-urlencoded：就是application/x-www-from-urlencoded,会将表单内的数据转换为键值对，比如,name=java&age = 23
	
	
	raw:可以上传任意格式的文本，可以上传text、json、xml、html等
	
	binary:相当于Content-Type:application/octet-stream,从字面意思得知，只可以上传二进制数据，通常用来上传文件，由于没有键值，所以，一次只能上传一个文件。


[Using the Interceptor to read and write cookies](http://blog.getpostman.com/2014/11/28/using-the-interceptor-to-read-and-write-cookies/)
