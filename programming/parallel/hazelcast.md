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


###  Distributed Primitives
#### IAtomicLong
	
Replication: the IAtomicLong has 1 synchronous backup and zero asynchronous backups and is not configurable.

#### IdGenerator

If the cluster restarts, then the IdGenerator is reset and starts from 0 because the IdGenerator doesn’t persist its state using, for example, a database. If you need this, you could create your own IdGenerator based on the same implementation mechanism the IdGenerator uses, but you persist the updates to the IAtomicLong.


#### ILock

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


#### ICondition
* Just as with the normal Condition, the ICondition can suffer from spurious wakeups. That is why the condition always needs to be checked inside a loop, instead of an if statement.

* You can choose to signal only a single thread instead of all threads by calling the ICondition.signal() method instead of the ICondition.signalAll() method.

* In the example, the waiting thread waits indefinitely because it calls await(). In practice, this can be undesirable since a member that is supposed to signal the condition can fail. When this happens, the threads that are waiting for the signal wait indefinitely. That is why it is often a good practice to wait with a timeout using the await(long time, TimeUnit unit) or awaitNanos(long nanosTimeout) method.

* Waiting threads are signaled in FIFO order.

* Replication: the ICondition has 1 synchronous backup and zero asynchronous backups and is not configurable.

#### ISemaphore

Hazelcast provides replication support for the ISemaphore: if a member goes and replication is enabled (by default it is), then another member takes over the semaphore without permit information getting lost. This can be done by synchronous and asynchronous replication, which can be configured using the backup-count and async-backup-count properties:


	backup-count: Number of synchronous replicas and defaults to 1.
	
	async-backup-count: Number of asynchronous replicas and defaults to 0.

If high performance is more important than permit information getting lost, you might consider setting backup-count to 0.


Fairness. The ISemaphore acquire methods are fair and this is not configurable. So under contention, the longest waiting thread for a permit will acquire it before all other threads. This is done to prevent starvation, at the expense of reduced throughput.

Automatic permit release. One of the features of the ISemaphore to make it more reliable in a distributed environment is the automatic release of a permit when the member fails (similar to the Hazelcast Lock). If the permit would not be released, the system could run in a deadlock.

The acquire() method doesn’t timeout, unlike the Hazelcast Lock.lock() method. To prevent running into a deadlock, you can use one of timed acquire methods, like ISemaphore.tryAcquire(int permits, long timeout, TimeUnit unit).

The initial-permits is allowed to be negative, indicating that there is a shortage of permits when the semaphore is created.



#### ICountDownLatch
The ICountDownLatch is a very useful synchronization aid, it probably isn’t the one you will use on a daily basis. Unlike Java’s implementation, Hazelcast’s ICountDownLatch count can be reset after a countdown has finished, but it cannot be reset during an active count.
the ICountDownLatch has 1 synchronous backup and zero asynchronous backups and is not configurable.

#### IQueue

It is important to understand that the IQueue is not a partitioned data structure like the IMap, so the content of the IQueue will not be spread over the members in the cluster. A single member in the cluster will be responsible for keeping the complete content of the IQueue in memory

If you want increased high availability, you can either increase the backup-count or the async-backup-count. If you want to have improved performance, you can set the backup-count to 0, but at the cost of potentially losing entries on failure.


### Distributed Collections


#### IList

A List is a collection where every element only occurs once and where the order of the elements does matter. 

#### ISet
A Set is a collection where every element only occurs once and where the order of the elements doesn’t matter. The Hazelcast com.hazelcast.core.ISet implements the java.util.Set.

Just as with normal HashSet, the hashcode() and equals() methods of the object are used and not the equals/hash of the byte array version of that object.

In Hazelcast, the ISet (and the IList) is implemented as a collection within the MultiMap, where the ID of the Set is the key in the MultiMap and the value is the collection. This means that the ISet is not partitioned, so you can’t scale beyond the capacity of a single machine and you cannot control the partition where data from a Set is going to be stored. If you want to have a distributed Set that behaves more like the distributed Map, you can implement a Set based on a Map where the value is some bogus value. It is not possible to rely on the Map.keySet for returning a usable distributed Set, since it will return a non-distributed snapshot of the keys.


#### Collection ItemListener
The IList, ISet and IQueue interfaces extend the com.hazelcast.core.ICollection interface. Hazelcast enriches the existing collections API with the ability to listen to changes in the collections using the com.hazelcast.core.ItemListener. The ItemListener receives the ItemEvent which potentially contains the item, the member where the change is happened, and the type of event (add or remove).


### Distributed Map

Internally, Hazelcast divides the map into partitions and it distributes the partitions evenly among the members in the cluster. The partition of a map entry is based on the key of that entry; each key belongs to a single partition. By default, Hazelcast uses 271 partitions for all partitioned data structures. This value can be changed with the hazelcast.map.partition.count property.

When a new member is added, the oldest member in the cluster decides which partitions are going to be moved to that new member. Once the partitions are moved, the new member will take its share in the load. Thus, to scale up a cluster, just add new members to the cluster.

When a member is removed, all the partitions that member owned are moved to other members. So scaling down a cluster is simple, just remove members from the cluster. Apart from a ’soft’ removal of the member, there can be a ’hard’ removal, for example, if the member crashes or gets disconnected from the cluster due to network issues. Luckily, Hazelcast provides various degrees of failover to deal with this situation. By default there will be one synchronous backup, so the failure of a single member will not lead to loss of data because a replica of that data is available on another member.


#### Partition Control
Collocating data in a single partition often needs to be combined with sending the functionality to the partition that contains the collocated data. For example, if an invoice needs to be created for the orders of a customer, a Callable that creates the Invoice could be sent using the IExecutorService.executeOnKeyOwner(invoiceCallable, customerId) method. If you do not send the function to the correct partition, collocating data is not useful since a remote call is done for every piece of data. 

####  High Availability

By default, Hazelcast provides sequential consistency; when a Map entry is read, the most recent written value is seen. This is accomplished by routing the get request to the member that owns the key. Therefore, there will be no out-of-sync copies. But sequential consistency comes at a price: if the value is read on an arbitrary cluster member, then Hazelcast needs to do a remote call to the member that owns the partition for that key. Hazelcast provides the option to increase performance by reducing consistency. This is done by allowing reads to potentially see stale data. This feature is available only when there is at least 1 backup (synchronous or asynchronous). You can enable it by setting the read-backup-data property


#### Eviction 
By default, all the Map entries that are put in the Map will remain in that Map. You can delete them manually, but you can also rely on an eviction policy that deletes items automatically. This feature enables Hazelcast to be used as a distributed cache since hot data is kept in memory and cold data is evicted.

#### Near Cache

Hazelcast’s solution to this problem is the near cache. Near cache makes map entries locally available by adding a local cache attached to the map. Imagine a web shop where articles can be ordered and where these articles are stored in a Hazelcast map. 



#### Concurrency Control
1.  Pessimistic Locking
2. Optimistic Locking


#### EntryProcessor
One of the new features of Hazelcast 3.0 is the EntryProcessor. It allows you to send a function, the EntryProcessor, to a particular key or to all keys in an IMap. Once the EntryProcessor is completed, it is discarded, so it is not a durable mechanism like the EntryListener or the MapInterceptor.

The EntryProcessor was added to Hazelcast to address cases like this. The EntryProcessor captures the logic that should be executed on a map entry. Hazelcast will send the EntryProcessor to each member in the cluster, and then each member will, in parallel, apply the EntryProcessor to all map entries. This means that the EntryProcessor is scalable; the more machines you add, the faster the processing will be completed. Another important feature of the EntryProcessor is that it will deal with race problems by acquiring exclusive access to the map entry when it is processing.

Entry processors can be used with predicates. Predicates help to process a subset of data by selecting eligible entries. This selection can happen either by doing a full-table scan or by using indexes. To accelerate entry selection step, you can consider to add indexes. If indexes are there, entry processor will automatically use them.


InMemoryFormat: If you are often using the EntryProcessor or queries, it might be a good idea to use the InMemoryFormat.OBJECT. The OBJECT in-memory format in Hazelcast will not serialize/deserialize the entry, so you are able to apply the EntryProcessor without serialization cost. The value instance that is stored is passed to the EntryProcessor, and that instance will also be stored in the map entry (unless you create a new instance). For more information, see InMemoryFormat.


#### MapListener

To correctly use the MapListener, you must understand the threading model. Unlike the EntryProcessor, the MapListener doesn’t run on the partition threads. MapListener runs on event threads, the same threads that are used by other collection listeners and by ITopic message listeners. The MapListener is allowed to access other partitions. Just like other logic that runs on an event thread, you need to watch out for long running tasks because it could lead to starvation of other event listeners since they don’t get a thread. It can also lead to OOME because of events being queued quicker than they are being processed.


A MapListener that is registered using a predicate. This makes it possible to listen to the changes made to specific map entries.Filtered at the source: The predicate of the continuous query is registered at the source; it is registered on each member that generates an event for a given partition. This means that if a predicate filters out an event, the event will not be sent over the line to the listener.

####  Distributed Queries
Hazelcast provides two APIs for distributed queries.

1. Criteria API
2. Distributed SQL Query

#### MapReduce
MapReduce is a software framework for processing large amounts of data in a distributed way. Therefore, the processing is normally spread over several machines. The basic idea behind MapReduce is to map your source data into a collection of key-value pairs and reducing those pairs, grouped by key, in a second step towards the final result.
The main idea can be summarized as first reading the source data, then mapping the data to one or multiple key-value pairs, and finally reducing all pairs with the same key.

The best known examples for MapReduce algorithms are text processing tools, such as counting the word frequency in large texts or websites. Apart from that, there are more interesting examples of use cases such as log analysis, data querying, aggregation and summing, distributed sort, and fraud detection.

#### Fast-Aggregations
Aggregators are ready-to-use data aggregations that are based on the Hazelcast MapReduce framework. They can be used for typical operations like summing up values, finding minimum or maximum values, calculating averages, and other operations that you would expect in the relational database world. Being the successor of the Hazelcast Aggregators, Fast-Aggregations are equivalent to the MapReduce Aggregators in most of the use cases and they run on the Query infrastructure.

#### Projections
Instead of sending all the data returned by a query, you may want to transform each result object in order to avoid redundant network traffic. For example, you select all employees based on some criteria, but you just want to return their name instead of the whole Employee object. It is easily doable with the Projection API 

#### Indexes
The Hazelcast map supports indexes to speed up queries, just like in databases. Using an index prevents iterating over all values. In database terms, this is called a full table scan, but it directly jumps to the interesting ones. There are two types of indexes:

1. Ordered. For example, a numeric field where you want to do range searches like "bigger than."
2. Unordered. For example, a name field.

#### MultiMap
In some cases you need to store multiple values for a single key. You could use a normal collection as value and store the real values in this collection. This will work fine if everything is done in the memory, but in a distributed and concurrent environment it isn’t that easy. One problem with this approach is that the whole collection needs to be deserialized for an operation such as add. Imagine a collection of 100 elements; then 100 elements need to be deserialized when the value is read, and 101 items are serialized when the value is written, for a total of 201 elements. Hazelcast provides a MultiMap where multiple values can be stored under a single key.


#### Replicated Map
There may be some cases where you have an application which has mostly read operations and you do not need to read the latest up-to-date data. To have fast access to those data, you can use Hazelcast’s Replicated Map, which is a distributed key-value data structure where the data is copied to all members of your cluster.



### Distributed Executor Service
####  Routing
Until now, we didn’t care which member did the actual processing of the task, as long as a member picks it up. But in some cases you want to have that control. For this purpose, the IExecutorService provides different ways to route tasks.

Any member. This is the default configuration.

A specific member.

The member hosting a specific key.

All or subset of the members.

#### Executing on Key Owner
When an operation is executed in a distributed system, that operation often needs to access distributed resources. If these resources are hosted on a different member than where the task is running, scalability and performance may suffer due to remoting overhead. This problem can be solved by improving locality of reference.In Hazelcast this can be done by placing the resources for a task in a partition and sending the task to the member that owns that partition. When you design a distributed system, perhaps the most fundamental step is designing the partitioning scheme.

#### Executing on All or Subset of Members

#### Futures
The Executor interface only exposes a single void execute(Runnable) method that can be called to have a Runnable asynchronously executed. However, in some cases you need to synchronize on results, such as when you use a Callable or you just want to wait till a task completes.

####  Durable Executor Service
Introduced with Hazelcast 3.7, this new data structure has been developed to provide a fault tolerant executor service, i.e., it is the durable implementation of Hazelcast’s IExecutor. The primary goal is not loosing any tasks or task responses when a member/task submitter goes down at any time including the times where a task is being executed. Durable executor service achieves this goal by storing an execution task both on the executing Hazelcast member and its backups, if configured.


#### Scheduled Executor Service
Hazelcast’s scheduled executor service implements the java.util.concurrent.ScheduledExecutorService. It allows the scheduling of a single future execution and/or at a fixed rate execution but not at a fixed delay.

### Distributed Topic

#### Message Ordering
Hazelcast provides certain ordering guarantees on the delivery of messages. If a cluster member publishes a sequence of messages, Hazelcast guarantees that each MessageListener will receive these messages in the order they were published by that member


### Hazelcast Clients
A client allows you to connect to the cluster and not have any of the responsibilities a normal cluster member has. When a Hazelcast operation is performed by a client, the operation is forwarded to a cluster member where it will be processed. 

#### Client Config
Hazelcast will use the following sequence of steps to determine the client configuration file to use.

Check if there is a system property hazelcast.client.config. If it exists, it is used. This means that you can set the configuration from the command line using -Dhazelcast.client.config=/foo/bar/client.xml. You can also refer to a classpath resource using -Dhazelcast.client.config=classpath:client.xml. This makes it possible to bundle multiple configurations in your JAR and select one on startup.

1. Check if there is a file called hazelcast-client.xml in the working directory.

2. Check if there is a file called hazelcast-client.xml on the classpath.

3. Default to hazelcast-client-default.xml, which is provided by Hazelcast.


####  Reusing the Client
A client is designed to be shared between threads. You want to prevent creating an instance per request because clients are heavy objects.
A client contains a thread pool that is used for internal administration like heartbeat checking, scheduling of refreshing partitions, firing events when members are added and removed, etc.A client has a single connection to the cluster for communication, just like cluster members have among each other. This connection is an expensive resource and it is best to reuse it.In most cases, it is best to create the client in the beginning and keep reusing it throughout the lifecycle of the client application.

### 参考资料

[https://hazelcast.org/features/](https://hazelcast.org/features/)

[Mastering Hazelcast IMDG](https://hazelcast.org/mastering-hazelcast/)` `