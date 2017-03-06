# Architectural Design Patterns for Cloud Computing(AWS 2011)


## Most Applications Need: 
1. Compute计算
2. Storage存储
3. Messaging消息传递
4. Payment支付
5. Distribution 分发
6. Scale扩展
7. Analytics分析


## 可扩展服务的典型特征

1. Increasing resources results in a proportional increase in performance——增加资源会成比例的提升性能
1. A scalable service is capable of handling heterogeneity ——可扩展服务能处理异构性
2. A scalable service is operationally efficient——可扩展服务操作效率高
3. A scalable service is resilient-可扩展服务是有弹性的
3. A scalable service becomes more cost effective when it grows-可扩展服务增长的时候，成本会降低


## Cloud Architecture Lessons
 1. Design for failure and nothing fails
 2. Loose coupling sets you free
 3. Implement “Elasticity”
 4. Build Security in every layer
 5. Don't fear constraints
 6. Think Parallel
 7. Leverage different storage options


### Design for Failure with AWS

2. Use Elastic IP addresses for consistent and re-mappable routes 
3. Use multiple Amazon EC2 Availability Zones (AZs)
4. Create multiple database slaves across AZs
5. Use real-time monitoring (Amazon CloudWatch)
6. Use Amazon Elastic Block Store (EBS) 

### Build Loosely Coupled Systems(The looser they're coupled, the bigger they scale)
1. Independent components 
2. Design everything as a Black Box 
3. De-coupling for Hybrid models 
4. Load-balance clusters

### Implement Elasticity(Elasticity is fundamental property of the Cloud)



###Build Security in every layer（Design with Security in mind）
1. Create distinct Security Groups for each Amazon EC2 cluster 
2. Use group-based rules for controlling access between layers Restrict external access to specific IP ranges
3. Encrypt data “at-rest” in Amazon S3
4. Encrypt data “in-transit” (SSL)
5. Consider encrypted file systems in EC2 for sensitive data 
6. Rotate your AWS Credentials, Pass in as arguments encrypted 
7. Use MultiFactor Authentication
