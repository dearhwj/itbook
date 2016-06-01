# SQL Tips

### HAVING 子句
	在 SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与合计函数一起使用。
	
	SQL HAVING 语法
	SELECT column_name, aggregate_function(column_name)
	FROM table_name
	WHERE column_name operator value
	GROUP BY column_name
	HAVING aggregate_function(column_name) operator value