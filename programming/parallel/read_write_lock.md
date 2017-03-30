# 读写锁


##  ReentrantReadWriteLock读写锁


ReentrantReadWriteLock会使用两把锁来解决问题，一个读锁，一个写锁
线程进入读锁的前提条件：

1. 没有其他线程的写锁，
2. 没有写请求或者有写请求，但调用线程和持有锁的线程是同一个

线程进入写锁的前提条件：

1. 没有其他线程的读锁
2. 没有其他线程的写锁

到ReentrantReadWriteLock，首先要做的是与ReentrantLock划清界限。它和后者都是单独的实现，彼此之间没有继承或实现的关系。lock方法 是基于CAS 来实现的。总结这个锁机制的特性了：
 
1. 重入方面其内部的WriteLock可以获取ReadLock，但是反过来ReadLock想要获得WriteLock则永远都不要想。 
2. WriteLock可以降级为ReadLock，顺序是：先获得WriteLock再获得ReadLock，然后释放WriteLock，这时候线程将保持Readlock的持有。反过来ReadLock想要升级为WriteLock则不可能，为什么？参看(a)，呵呵. 
3. ReadLock可以被多个线程持有并且在作用时排斥任何的WriteLock，而WriteLock则是完全的互斥。这一特性最为重要，因为对于高读取频率而相对较低写入的数据结构，使用此类锁同步机制则可以提高并发量。 
5. 不管是ReadLock还是WriteLock都支持Interrupt，语义与ReentrantLock一致。 
5. WriteLock支持Condition并且与ReentrantLock语义一致，而ReadLock则不能使用Condition，否则抛出UnsupportedOperationException异常。 
     
     

```
package com.thread;
  
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
 
public class CacheDemo {
     private Map<String, Object> map = new HashMap<String, Object>();//缓存器
     private ReadWriteLock rwl = new ReentrantReadWriteLock();
     public static void main(String[] args) {
         
     }
     public Object get(String id){
         Object value = null;
         rwl.readLock().lock();//首先开启读锁，从缓存中去取
         try{
             value = map.get(id); 
             if(value == null){  //如果缓存中没有释放读锁，上写锁
                 rwl.readLock().unlock();
                 rwl.writeLock().lock();
                 try{
                     if(value == null){
                         value = "aaa";  //此时可以去数据库中查找，这里简单的模拟一下
                     }
                 }finally{
                     rwl.writeLock().unlock(); //释放写锁
                 }
                 rwl.readLock().lock(); //然后再上读锁
             }
         }finally{
             rwl.readLock().unlock(); //最后释放读锁
         }
         return value;
     }
 
}


```

## 参考资料
[ReentrantReadWriteLock读写锁的使用](http://www.cnblogs.com/liuling/archive/2013/08/21/2013-8-21-03.html)