# grep tips

[grep的-A-B-选项详解(转)](http://blog.itpub.net/8225414/viewspace-945952/)

	1. grep -A1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之后的一行(After 1)
	2. grep -B1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之前的一行(Before 1)
	3. grep -1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之前的一行(After 1)和显示之后的一行(After 1
 
 
 [grep 文件报错 “Binary file ... matches”的处理](http://www.cnblogs.com/welkinwalker/archive/2011/05/18/2049903.html)
 
 
 	-a, --text
              Process a binary file as if it were text; this is equivalent to the --binary-files=text option. 

	这个时候加上-a参数就解决了 