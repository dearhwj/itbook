# Twitter的分布式自增ID算法Snowflake实现分析
原文地址：[http://www.cppblog.com/tx7do/archive/2014/06/10/207248.html)


在分布式系统中，需要生成全局UID的场合还是比较多的，twitter的snowflake解决了这种需求，实现也还是很简单的，除去配置信息，核心代码就是毫秒级时间41位+机器ID 10位+毫秒内序列12位。

该项目地址为：https://github.com/twitter/snowflake是用Scala实现的


一个Java实现，貌似为淘宝的朋友写的。

```
public class IdWorker {
 private final long workerId;
 private final static long twepoch = 1361753741828L;
 private long sequence = 0L;
 private final static long workerIdBits = 4L;
 public final static long maxWorkerId = -1L ^ -1L << workerIdBits;
 private final static long sequenceBits = 10L;
 private final static long workerIdShift = sequenceBits;
 private final static long timestampLeftShift = sequenceBits + workerIdBits;
 public final static long sequenceMask = -1L ^ -1L << sequenceBits;
 private long lastTimestamp = -1L;

 public IdWorker(final long workerId) {
  super();
  if (workerId > this.maxWorkerId || workerId < 0) {
   throw new IllegalArgumentException(String.format(
     "worker Id can't be greater than %d or less than 0",
     this.maxWorkerId));
  }
  this.workerId = workerId;
 }

 

 public synchronized long nextId() {
  long timestamp = this.timeGen();
  if (this.lastTimestamp == timestamp) {
   this.sequence = (this.sequence + 1) & this.sequenceMask;
   if (this.sequence == 0) {
    System.out.println("###########" + sequenceMask);
    timestamp = this.tilNextMillis(this.lastTimestamp);
   }
  } else {
   this.sequence = 0;
  }
  if (timestamp < this.lastTimestamp) {
   try {
    throw new Exception(
      String.format(
        "Clock moved backwards.  Refusing to generate id for %d milliseconds",
        this.lastTimestamp - timestamp));

   } catch (Exception e) {
    e.printStackTrace();
   }
  }

 
  this.lastTimestamp = timestamp;
  long nextId = ((timestamp - twepoch << timestampLeftShift))
    | (this.workerId << this.workerIdShift) | (this.sequence);
//  System.out.println("timestamp:" + timestamp + ",timestampLeftShift:"
//    + timestampLeftShift + ",nextId:" + nextId + ",workerId:"
//    + workerId + ",sequence:" + sequence);
  return nextId;
 }

 private long tilNextMillis(final long lastTimestamp) {
  long timestamp = this.timeGen();
  while (timestamp <= lastTimestamp) {
   timestamp = this.timeGen();
  }
  return timestamp;
 }

 
 private long timeGen() {
  return System.currentTimeMillis();
 }
  
 public static void main(String[] args){
  IdWorker worker2 = new IdWorker(2);
  System.out.println(worker2.nextId());
 }


}


```

### 其他相关的文章
[Twitter-Snowflake，64位自增ID算法详解](http://www.lanindex.com/twitter-snowflake%EF%BC%8C64%E4%BD%8D%E8%87%AA%E5%A2%9Eid%E7%AE%97%E6%B3%95%E8%AF%A6%E8%A7%A3/)

