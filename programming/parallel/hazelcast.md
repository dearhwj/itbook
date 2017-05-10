# Hazelcast教程
Hazelcast是一个用Java编写的基于内存的数据网格管理平台（open source in-memory data grid）

## 功能
### 支持的数据结构

#### Distributed Caching
1. AtomicLong
2. AtomicReference
3. CountDownLatch
4. IdGenerator
5. List
6. Lock
7. Map
8. MultiMap
9. Queues
10. Replicated Map
11. Ringbuffer
12. Semaphores
13. Set
14. Topic and ReliableTopic


#### Distributed Compute
1. Entry Processor
2. Executor Service
3. Scheduled Executor
4. User Defined Services


#### Distributed Query
1. Fast Aggregations
2. Continuous Query
3. Listener with Predicate
4. MapReduce
5. Query

#### Integrated Clustering 
1. Hibernate Second Level Cache
2. Tomcat Clustered Web Sessions
3. Jetty Clustered Web Sessions
4. Grails 3
5. Hazelcast JCS Resource Adapter


## 开发

### Resolving Hazelcast Configuration Files

1. Hazelcast checks whether the hazelcast.config system property is set. If it is, then its value is used as the path to the configuration file. This is useful if you want the application to choose the Hazelcast configuration file at the time of startup. The config option can be set by adding the following to the java command:

	-Dhazelcast.config=<path to the hazelcast.xml>.
2. Hazelcast checks if there is a hazelcast.xml in the working directory.

3. Hazelcast checks if there is a hazelcast.xml on the classpath.
4. If all of the above options fail to provide a Hazelcast config to the application, the default Hazelcast configuration is loaded from the Hazelcast JAR. 


Hazelcast config is not updatable: Once a HazelcastInstance is created, the Config that was used to create that HazelcastInstance should not be updated. A lot of the internal configuration objects are not thread-safe and there is no guarantee that a property is going to be read again after it has been read for the first time.


### Loading a DistributedObject
For most of the DistributedObjects, you can find a get method on the HazelcastInstance. In case you are writing custom distributed objects using the SPI, you can use the HazelcastInstance.getDistributedObject. One thing worth mentioning is that most of the distributed objects defined in the configuration are created lazily. They are only created on the first operation that accesses them.


### Unique Names for Distributed Objects
Some of the distributed objects will be static. They will be created and used through the application and the IDs of these objects will be known up front. Other distributed objects are created on the fly, and one of the problems is finding unique names when new data structures need to be created. One of the solutions to this problem is to use the IdGenerator, which will generate cluster wide unique IDs.



### Destroying a DistributedObject

A DistributedObject can be destroyed using the DistributedObject.destroy() method, which clears and releases all resources for this object within the cluster. You should use this method with care because once the destroy method is called and the resources are released, a subsequent load with the same ID from the HazelcastInstance will result in a new data structure without throwing an exception.


A similar issue occurs with references. If a reference to a DistributedObject is used after the DistributedObject is destroyed, new resources will be created.

### Controlled Partitioning

Hazelcast has two types of distributed objects.

One type is the truly partitioned data structure, like the IMap, where each partition will store a section of the Map.

The other type is a non-partitioned data structure, like the IAtomicLong or the ISemaphore, where only a single partition is responsible for storing the main instance. For this type, you sometimes want to control that partition.


	ISemaphore s1 = hz.getSemaphore("s1");
	ISemaphore s2 = hz.getSemaphore("s2");

They would end up in different partitions because they have different names. Luckily, Hazelcast provides a solution for that using the @ symbol, as in the following example.

	ISemaphore s1 = hz.getSemaphore("s1@foo");
	ISemaphore s2 = hz.getSemaphore("s2@foo");

Now, s1 and s2 will end up in the same partition because they share the same partition key: foo.  


If @ is used in the name of a partitioned DistributedObject, such as the IMap or IExecutorService, then Hazelcast keeps using the full String as the name of the DistributedObject, but ignores the partition key. This is because for these types, a partition key does not have any meaning.


### IAtomicLong
	
Replication: the IAtomicLong has 1 synchronous backup and zero asynchronous backups and is not configurable.

### IdGenerator

If the cluster restarts, then the IdGenerator is reset and starts from 0 because the IdGenerator doesn’t persist its state using, for example, a database. If you need this, you could create your own IdGenerator based on the same implementation mechanism the IdGenerator uses, but you persist the updates to the IAtomicLong.


### ILock

* Hazelcast lock is reentrant, so you can acquire it multiple times in a single thread without causing a deadlock. Of course, you need to release it as many times as you have acquired it to make it available to other threads.

* As with the other Lock implementations, Hazelcast lock should always be acquired outside of a try/finally block. Otherwise, the lock acquire can fail, but an unlock is still executed.

* Keep locks as short as possible. If locks are kept too long, it can lead to performance problems, or worse, deadlock.

* With locks it is easy to run into deadlocks. Having code you don’t control or understand running inside your locks is asking for problems. Make sure you understand exactly the scope of the lock.

* To reduce the chance of a deadlock, you can use the Lock.tryLock method to control the waiting period. The lock.lock() method will not block indefinitely, but will timeout with an OperationTimeoutException after 300 seconds.

* Locks are automatically released when a member has acquired a lock and that member goes down. This prevents threads that are waiting for a lock from waiting indefinitely. This is also needed for failover to work in a distributed system. The downside is that if a member goes down that acquired the lock and started to make changes, other members could start to see partial changes. In these cases, either the system could do some self repair or a transaction might solve the problem.

* A lock must always be released by the same thread that acquired it, otherwise try ISemaphore.

* Locks are fair, so they will be granted in the order they are requested.

* There are no configuration options available for the lock.

* A lock can be checked if it is locked using the ILock.isLocked method, although the value could be stale as soon as it is returned.

* A lock can be forced to unlock using the ILock.forceUnlock() method. It should be used with extreme care since it could break a critical section.

* The Hazelcast.getLock doesn’t work on a name of type String, but can be a key of any type. This key will be serialized and the byte array content determines the actual lock to acquire. So, if you are passing in an object as key, it isn’t the monitor lock of that object that is being acquired.

* Replication: the ILock has one synchronous backup and zero asynchronous backups and is not configurable.

* A lock is not automatically garbage collected. So if you create new locks over time, make sure to destroy them. If you don’t, you can run into an OutOfMemoryError.


### ICondition
* Just as with the normal Condition, the ICondition can suffer from spurious wakeups. That is why the condition always needs to be checked inside a loop, instead of an if statement.

* You can choose to signal only a single thread instead of all threads by calling the ICondition.signal() method instead of the ICondition.signalAll() method.

* In the example, the waiting thread waits indefinitely because it calls await(). In practice, this can be undesirable since a member that is supposed to signal the condition can fail. When this happens, the threads that are waiting for the signal wait indefinitely. That is why it is often a good practice to wait with a timeout using the await(long time, TimeUnit unit) or awaitNanos(long nanosTimeout) method.

* Waiting threads are signaled in FIFO order.

* Replication: the ICondition has 1 synchronous backup and zero asynchronous backups and is not configurable.

### ISemaphore

Hazelcast provides replication support for the ISemaphore: if a member goes and replication is enabled (by default it is), then another member takes over the semaphore without permit information getting lost. This can be done by synchronous and asynchronous replication, which can be configured using the backup-count and async-backup-count properties:


	backup-count: Number of synchronous replicas and defaults to 1.
	
	async-backup-count: Number of asynchronous replicas and defaults to 0.

If high performance is more important than permit information getting lost, you might consider setting backup-count to 0.


Fairness. The ISemaphore acquire methods are fair and this is not configurable. So under contention, the longest waiting thread for a permit will acquire it before all other threads. This is done to prevent starvation, at the expense of reduced throughput.

Automatic permit release. One of the features of the ISemaphore to make it more reliable in a distributed environment is the automatic release of a permit when the member fails (similar to the Hazelcast Lock). If the permit would not be released, the system could run in a deadlock.

The acquire() method doesn’t timeout, unlike the Hazelcast Lock.lock() method. To prevent running into a deadlock, you can use one of timed acquire methods, like ISemaphore.tryAcquire(int permits, long timeout, TimeUnit unit).

The initial-permits is allowed to be negative, indicating that there is a shortage of permits when the semaphore is created.



### ICountDownLatch


### 参考资料

[https://hazelcast.org/features/](https://hazelcast.org/features/)

[Mastering Hazelcast IMDG](https://hazelcast.org/mastering-hazelcast/)