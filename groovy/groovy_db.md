# Groovy数据库操作


### 数据库连接

```
def sql = groovy.sql.Sql.newInstance('jdbc:mysql://localhost:3306/weatherinfo', 
userid, password, 'com.mysql.jdbc.Driver')

```


### 查询数据库

#### sql.eachRow

sql.eachRow 接受两个closure一个是针对metadata的，另外一个是针对数据的

```
sql.eachRow('SELECT * from weather') {printf "%-20s%s\n", it.city, it[1] }
```


#### sql.dataSet
sql.dataSet参数是一个表名

the DataSet is further refined with a specialized query based on the select predicate we provide

```
dataSet = sql.dataSet('weather')citiesBelowFreezing = dataSet.findAll { it.temperature < 32 } println "Cities below freezing:"citiesBelowFreezing.each {        println it.city      }

```


#### 插入&更新数据
1. DataSet object to add data, not just filter data. The add() method accepts a map of data to create a row
2.  we can insert data using the Sql class’s execute() or executeInsert() method

