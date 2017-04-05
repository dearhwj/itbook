# cpu cache line 原理


cpu的cache通常较大, 比如 128KB, 被划分为多个有固定大小的cache line, cache line通常是32Byte或64Byte.

CPU内部的cache种类, 至少有三种
1. 指令cache
2. 数据cache 通常有多级 multi-level
3. TLB 加速虚拟地址2物理地址转换

cache entry (cache条目)
包含如下部分
1. cache line : 从主存一次copy的数据大小)
1. tag : 标记cache line对应的主存的地址
1. falg : 标记当前cache line是否invalid, 如果是数据cache, 还有是否dirty

cpu访问主存的规律
1. cpu从来都不直接访问主存, 都是通过cache间接访问主存
2. 每次需要访问主存时, 遍历一遍全部cache line, 查找主存的地址是否在某个cache line中.
3. 如果cache中没有找到, 则分配一个新的cache entry, 把主存的内存copy到cache line中, 再从cache line中读取.


cache中包含的cache entry条目有限, 所以, 必须有合适的cache淘汰策略。一般使用的是LRU策略.将一些主存区域标记为non-cacheble, 可以提高cache命中率, 降低没用的cache


回写策略
cache中的数据更新后,需要回写到主存, 回写的时机有多种
1. 每次更新都回写. write-through cache
2. 更新后不回写,标记为dirty, 仅当cache entry被evict时才回写
3. 更新后, 把cache entry送如回写队列, 待队列收集到多个entry时批量回写.

有两种情况可能导致cache中的数据过期
1. DMA, 有其他设备直接更新主存的数据
2. SMP, 同一个cache line存在多个CPU各自的cache中. 其中一个CPU对其进行了更新.


cpu stall cpu失速
指的是当cache miss时(特别是read cache miss), cpu在等待数据从内存读进去cache中期间, 没事可做.
解决此问题的方法有
1) 超线程技术. CPU在硬件层面, 把一个CPU模拟成两个CPU, 在上层看来是两个CPU. 并发的执行两个线程. 这样当一个线程因cache miss在等待时, 另一个线程可以执行.


主存的一个地址, 需要被映射进哪个cache line? (术语:Associativity)根据映射策略的不同而不同


1. 最笨的, 一个地址可被映射进任意cache line (fully associative)
   带来的问题是, 当寻找一个地址是否已经被cache时, 需要遍历每一个cache line来寻找, 这个代价不可接受.
   就像停车位可以大家随便停一样, 停的时候简单的, 找车的时候需要一个一个停车位的找了.
   你想下, cpu想知道一个地址是否已经在cache中了, 需要把全部cache line找一边, 那该有多慢?

2. Direct Mapped Cache  (相当于1-way associative)
   这个就是相当于hash了, 每个地址能被映射到的cache line是固定的. 
   每个人的停车位是固定分配好的. 可以直接找到.
   缺点是, 因为人多车少, 很可能几个人争用同一个车位, 导致cache 淘汰频繁. 需要频繁的从主存读取数据到cache, 这个代价也较高.
   由于cache中cache line的个数都是2的指数个. 那么, hash算法就很简单了, 不用取模, 直接把内存地址的某几个bit位拿出来即可. 比如cache line有128(2^7)个, cache line的大小是32(2^5)字节, 
   那么一个32位地址的 0~4位作为cache line内部偏移, 5~11位作为cache line的索引即可. 剩下的bit12~31作为当前cache line的tag. tag的作用时, 当有另外一个地址也映射到同一个cache line时, tag用来比较两个地址是不是同一个地址. 毕竟同一个cache-line可以对应的内存的位置非常多个的.

3. 2-way associative
   是fully associative和Direct Mapped Cache的折中.
   2-way, 每一个人可以有两个停车位, 这样当一个停车位被占了的时候, 还有机会寻找另外一个. 虽然人数众多, 但同时来找停车位的人并不多. (相当于很多人的车在外面,没有开回来)
   所以, 2-way associative近似的相当于有了2倍大小的cache, 使用Direct Mapped Cache策略.
   

循环执行时间长短由数组的内存访问次数决定的，而非整型数的乘法运算次数。背后的原因是今天的CPU不再是按字节访问内存，而是以64字节为单位的块(chunk)拿取，称为一个缓存行(cache line)。当你读一个特定的内存地址，整个缓存行将从主存换入缓存，并且访问同一个缓存行内的其它值的开销是很小的。



### 参考资料
[cpu cache line 原理](http://blog.csdn.net/zdl1016/article/details/8882092)

[2 7个示例科普CPU Cache line](http://blog.csdn.net/cool_way/article/details/41855595)