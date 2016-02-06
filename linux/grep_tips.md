# grep tips

[grep的-A-B-选项详解(转)](http://blog.itpub.net/8225414/viewspace-945952/)

	1. grep -A1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之后的一行(After 1)
	2. grep -B1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之前的一行(Before 1)
	3. grep -1 keyword filename
	找出filename中带有keyword的行，输出中除显示该行外，还显示之前的一行(After 1)和显示之后的一行(After 1