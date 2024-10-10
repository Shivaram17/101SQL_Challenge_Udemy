--a. write a sql statement that will show a count of schemas tables, and columns (do not --include views) in the adventureWorks database.


SELECT 
COUNT(DISTINCT s.name) as SchemaName,
COUNT(DISTINCT t.name) as TableName,
COUNT(c.name) as ColumnName
FROM sys.tables t
INNER JOIN sys.columns c ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON s.schema_id = t.schema_id

SELECT
COUNT(DISTINCT TABLE_SCHEMA) as TableSchema,
COUNT(DISTINCT TABLE_NAME) as TableName,
COUNT(Column_Name) as ColumnName
FROM information_schema.columns
WHERE TABLE_NAME not in (SELECT TABLE_NAME FROM information_schema.views);


--b. write a similar statement as part a but list each schema, table, and column (do not --include views). This table can be used later in the course.

SELECT 
s.name as SchemaName,
t.name as TableName,
c.name as ColumnName
FROM sys.tables t
INNER JOIN sys.columns c ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON s.schema_id = t.schema_id

SELECT
TABLE_SCHEMA as TableSchema,
TABLE_NAME as TableName,
Column_Name as ColumnName
FROM information_schema.columns
WHERE TABLE_NAME not in (SELECT TABLE_NAME FROM information_schema.views);


