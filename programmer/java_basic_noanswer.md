# Java基础面试题
###1. 下面哪些是Thread类的方法（）

1. start()
2. run()
3. exit()  	 
4. getPriority()

---

###2. 下面关于java.lang.Exception类的说法正确的是（）
1. 继承自Throwable      
2. Serialable 

---


###3. 下面程序的运行结果是（）

	
		String str1 = "hello";
		String str2 = "he" + new String("llo");
		System.err.println(str1 == str2);

1. true	
2. false


---

### 4.下列说法正确的有（）

1． class中的constructor不可省略

2． constructor必须与class同名，但方法不能与class同名

3． constructor在一个对象被new时执行

4. 一个class只能定义一个constructor



---

### 5.下面程序的运行结果
	 
	 	public static void main(String args[]) {

        Thread t = new Thread() {

            public void run() {
                pong();
            }
        };

        t.run();
        System.out.print("ping");

    	}

	    static void pong() {

        System.out.print("pong");

    	}
    	
    	
1. pingpong        
2. pongping       
3. pingpong和pongping都有可能       
4. 都不输出



---

### 6.GC线程是否为守护线程？（）

答案：是


---

### 7.volatile关键字是否能保证线程安全？（）


---

### 8.下列说法正确的是（）

1. LinkedList继承自List

2. AbstractSet继承自Set

3. HashSet继承自AbstractSet

4. WeakMap继承自HashMap


---

###9. 数字0.6332的数据类型是（）

1. float     
2. double     
3. Float      
4. Double


---

### 10.下面哪个流类属于面向字符的输入流(  )

	1.  BufferedWriter           
	2. FileInputStream          
	3. ObjectInputStream          
	4.  InputStreamReader


---

### 11.不通过构造函数也能创建对象吗（）

1. 是     
2. 否

---



### 12.下面哪些是对称加密算法（）

1. DES   
2. AES   
3. DSA   
4. RSA


---



### 13.接口和抽象类描述正确的有
1. 抽象类没有构造函数
2. 接口没有构造函数
3. 抽象类不允许多继承
4. 接口中的方法可以有方法体


---

### 14． 在Java中，关于HashMap类的描述，以下选项错误的是
1. HashMap使用键/值得形式保存数据
2. HashMap 能够保证其中元素的顺序
3. HashMap允许将null用作键
4. HashMap允许将null用作值



---

### 15. 在Java中可用于创建链表数据结构的对象。
1. LinkedList
2. ArrayList
3. Collection
4. HashMap



---

### 16.下列哪些情况可以终止当前线程的运行？
1. 抛出一个例外时。
2. 当该线程调用sleep()方法时。
3. 当创建一个新线程时。
4. 当一个优先级高的线程进入就绪状态时。

----
### 17.栈是一种()

1. 存取受限的线性结构

2. 存取不受限的线性结构

3. 存取受限的非线性结构

4. 存取不受限的非线性结构



----


###18. 接口是Java面向对象的实现机制之一，以下说法正确的是

1. Java支持多重继承，一个类可以实现多个接口；

2. Java只支持单重继承，一个类可以实现多个接口；

3. Java只支持单重继承，一个类只可以实现一个接口；

4. Java支持多重继承，但一个类只可以实现一个接口。



---


###19.在Servlet处理请求的方式为。(选择1项)

1. 以进程的方式

2. 以程序的方式

3. 以线程的方式

4. 以响应的方式



---



###20.Delete和 truncate 都可以用来删除表内容，一下描述正确的是？

1.Truncate 不需要 rollbacksegment

2．Delete 需要rollbacksegment

3.Truncate在 提交commit之前仍可回滚

4．Truncate还可以删除表结构




---

###21. 在Java中，一个类可同时定义许多同名的方法，这些方法的形式参数个数、类型或顺序各不相同，传回的值也可以不相同。这种面向对象程序的特性称为

1. 隐藏
2. 覆盖
3. 重载
4. Java不支持此特性


---

###22. 如何放掉一个指定占据的内存空间，请选择一个正确答案：

1. 调用free()方法。
2. 代用system.gc()方法。
3. 赋值给该项对象的引用为null.
4. 程序员无法明确强制垃圾回收器运行。
