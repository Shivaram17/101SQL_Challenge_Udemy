--a. Write a script that you can use to find every column in the database that includes "rate" in the column name.

--b. Write a script that you can use to find every table in the database that includes "History" in the table name.

SELECT t.name as TableName,
c.name as ColumnName
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
WHERE c.name like '%rate%';

SELECT t.name as TableName,
c.name as ColumnName
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
WHERE t.name like '%History%';
