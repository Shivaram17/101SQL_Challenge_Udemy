-- a. In this question we are going to put the script written in question 4 into a table. To keep the AdventureWorks   database clean create a new database called "Edited_AdventureWorks" (if you haven't already)
-- b. Using a Select Into put the script in question 4 into a table named "Table_Relationships" be sure to put this   table in the Edited_AdventureWorks database. Here is the script from question 4:
-- c. Find the Table in Object Explorer

-- d. In Question 1 we learned that the AdventureWorks database has 90 foreign key constraints; however, Table_Relationships has 91 rows/relationships. Find the foreign key that has been used twice. What does this mean?

-- e. How many Distinct Foreign Keys include BusinessEntityID as a column or referenced column?
USE AdventureWorks2019

--b
SELECT
	O.name as FK_Name,
	S1.name as SchemaName,
	T1.name as TableName,
	C1.name as ColumnName,
	S2.name as ReferencedSchemaName,
	T2.name as ReferencedTableName,
	C2.name as ReferencedColumnName
INTO Edited_AdventureWorks2019.dbo.Table_Relationships
FROM sys.foreign_key_columns FKC
	INNER JOIN sys.objects O ON O.object_id = FKC.constraint_object_id
	INNER JOIN sys.tables T1 ON T1.object_id = FKC.parent_object_id
	INNER JOIN sys.tables T2 ON T2.object_id = FKC.referenced_object_id 
	INNER JOIN sys.columns C1 ON C1.column_id = parent_column_id AND C1.object_id = T1.object_id
	INNER JOIN sys.columns C2 ON C2.column_id = referenced_column_id AND C2.object_id = T2.object_id
	INNER JOIN sys.schemas S1 ON T1.schema_id = S1.schema_id
	INNER JOIN sys.schemas S2 ON T2.schema_id = S2.schema_id;

--c

--d
SELECT 
	FK_Name,
	COUNT(*) as CNT
FROM Edited_AdventureWorks2019.dbo.Table_Relationships
GROUP BY FK_Name ORDER BY CNT DESC


--e

SELECT COUNT(*)
FROM Edited_AdventureWorks2019.dbo.Table_Relationships
WHERE ColumnName = 'BusinessEntityID'
OR
ReferencedColumnName = 'BusinessEntityID'
