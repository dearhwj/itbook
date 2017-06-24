# HUFFMAN编码压缩算法

### 编码步骤

一、对给定的n个权值{W1,W2,W3,...,Wi,...,Wn}构成n棵二叉树的初始集合F= {T1,T2,T3,...,Ti,...,Tn}，其中每棵二叉树Ti中只有一个权值为Wi的根结点，它的左右子树均为空。（为方便在计算机上实现算 法，一般还要求以Ti的权值Wi的升序排列。）  
二、在F中选取两棵根结点权值最小的树作为新构造的二叉树的左右子树，新二叉树的根结点的权值为其左右子树的根结点的权值之和。  
三、从F中删除这两棵树，并把这棵新的二叉树同样以升序排列加入到集合F中。  
四、重复二和三两步，直到集合F中只有一棵二叉树为止。

简易的理解就是，假如我有A,B,C,D,E五个字符，出现的频率（即权值）分别为5,4,3,2,1,那么我们第一步先取两个最小权值作为左右子树构造一个新树，即取1，2构成新树，其结点为1+2=3，如图：

[![12](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832078695.png "12")](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832079219.png)

虚线为新生成的结点，第二步再把新生成的权值为3的结点放到剩下的集合中，所以集合变成{5,4,3,3}，再根据第二步，取最小的两个权值构成新树，如图：

[![13](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832087092.png "13")](http://images.cnblogs.com/cnblogs_com/Jezze/201112/20111223183207124.png)

再依次建立哈夫曼树，如下图：

[![14](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832084301.jpg "14")](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832082109.jpg)

其中各个权值替换对应的字符即为下图：

[![15](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832086286.jpg "15")](http://images.cnblogs.com/cnblogs_com/Jezze/201112/201112231832085730.jpg)

所以各字符对应的编码为：A->11,B->10,C->00,D->011,E->010

霍夫曼编码是一种无前缀编码。解码时不会混淆。其主要应用在数据压缩，加密解密等场合。



### 解码

因为Huffman编码算法能够保证任何的二进制码都不会是另外一个码的前缀，解码非常简单，依次取出二进制的每一位，从树根向下搜索，1向右，0向左，到了叶子节点(命中)，退回根节点继续重复以上动作。


### 参考资料
[哈夫曼树与哈夫曼编码](http://www.cnblogs.com/wuyuankun/p/3982216.html)

[HUFFMAN 编码压缩算法](http://coolshell.cn/articles/7459.html)

[Huffman coding](https://en.wikipedia.org/wiki/Huffman_coding)