# Twitter的分布式自增ID算法Snowflake
原文地址：[http://www.cppblog.com/tx7do/archive/2014/06/10/207248.html](http://www.cppblog.com/tx7do/archive/2014/06/10/207248.html)


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


这个方法里面需要提供一个workerId(工作机器id).机器级的话你可以使用MAC地址来唯一标示工作机器，工作进程级可以使用IP+Path来区分工作进程,这个就看你的需求了。下面这段代码是根据网卡设备+进程ID生成工作机器id

```

static {
		try {
			// build a 2-byte machine piece based on NICs info
			int machinePiece;
			{
				try {
					StringBuilder sb = new StringBuilder();
					Enumeration<NetworkInterface> e = NetworkInterface.getNetworkInterfaces();
					while ( e.hasMoreElements() ) {
						NetworkInterface ni = e.nextElement();
						sb.append(ni.toString());
					}
					machinePiece = sb.toString().hashCode() << 16;
				} catch ( Throwable e ) {
					// exception sometimes happens with IBM JVM, use random
					logger.error(" IdWorker error. ", e);
					machinePiece = new Random().nextInt() << 16;
				}
				logger.debug("machine piece post: " + Integer.toHexString(machinePiece));
			}

			// add a 2 byte process piece. It must represent not only the JVM
			// but the class loader.
			// Since static var belong to class loader there could be collisions
			// otherwise
			final int processPiece;
			{
				int processId = new java.util.Random().nextInt();
				try {
					processId = java.lang.management.ManagementFactory.getRuntimeMXBean().getName().hashCode();
				} catch ( Throwable t ) {}

				ClassLoader loader = IdWorker.class.getClassLoader();
				int loaderId = loader != null ? System.identityHashCode(loader) : 0;

				StringBuilder sb = new StringBuilder();
				sb.append(Integer.toHexString(processId));
				sb.append(Integer.toHexString(loaderId));
				processPiece = sb.toString().hashCode() & 0xFFFF;
				logger.debug("process piece: " + Integer.toHexString(processPiece));
			}

			_genmachine = machinePiece | processPiece;
			logger.debug("machine : " + Integer.toHexString(_genmachine));
		} catch ( Exception e ) {
			throw new RuntimeException(e);
		}

	}
```


### 其他相关的文章
[Twitter-Snowflake，64位自增ID算法详解](http://www.lanindex.com/twitter-snowflake%EF%BC%8C64%E4%BD%8D%E8%87%AA%E5%A2%9Eid%E7%AE%97%E6%B3%95%E8%AF%A6%E8%A7%A3/)

