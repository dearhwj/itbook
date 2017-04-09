# API设计方法论
1. API要容易使用，没有细节需要学习
2. 灵活性。服务端可以修改控制业务
3. 一致性。 A 24-hour news network can’t sort the list by race then notoriety.
4. 松耦合。
5. 可优化的。如果数据库已经更新了，能够被计算，出来，而不是根据需求来构建。Optimizing the programmer’s design for every combination is much more difficult.
6. 能缓存。容易


### 参考资料
[Stop Designing Fragile Web APIs](https://mathieu.fenniak.net/stop-designing-fragile-web-apis/) 