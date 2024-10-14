-- Question 4:
-- This is a difficult question; however, the results will be used in majority of the questions moving forward. There is plenty of background to get you started; however, don't become overwhelmed by it. If you're struggling then move on to the Hint and the video explanation.

-- We learned in Question 1 that there are 71 tables in the AdventureWorks Database. We can also see these tables in  our entity relationship diagram (ERD). These tables are connected via primary keys and foreign keys.  For example, in the Sales.SalesOrderHeader table there  is a foreign key on the CurrencyRateID. This Foreign key is connected to the primary key in the Sales.CurrencyRate  table. Therefore, when we connect these two tables together we will use the CurrencyRateID from both tables. The name of this Foreign Key in the AdventureWorks database is  "FK_SalesOrderHeader_CurrencyRate_CurrencyRateID". We also  know which Schema, Table, and Column join to the referenced Schema, referenced Table, and referenced column.  (See Below)

-- ForeignKeyName: FK_SalesOrderHeader_CurrencyRate_CurrencyRateID

-- SchemaName: Sales

-- TableName: SalesOrderHeader

-- ColumnName: CurrencyRateID

-- ReferencedSchema: Sales

-- ReferencedTable: CurrencyRate

-- ReferencedColumn: CurrencyRateID



SELECT
	O.name as FK_Name,
	S1.name as SchemaName,
	T1.name as TableName,
	C1.name as ColumnName,
	S2.name as ReferencedSchemaName,
	T2.name as ReferencedTableName,
	C2.name as ReferencedColumnName
	FROM sys.foreign_key_columns FKC
		INNER JOIN sys.objects O ON O.object_id = FKC.constraint_object_id
		INNER JOIN sys.tables T1 ON T1.object_id = FKC.parent_object_id
		INNER JOIN sys.tables T2 ON T2.object_id = FKC.referenced_object_id 
		INNER JOIN sys.columns C1 ON C1.column_id = parent_column_id AND C1.object_id = T1.object_id
		INNER JOIN sys.columns C2 ON C2.column_id = referenced_column_id AND C2.object_id = T2.object_id
		INNER JOIN sys.schemas S1 ON T1.schema_id = S1.schema_id
		INNER JOIN sys.schemas S2 ON T2.schema_id = S2.schema_id;
