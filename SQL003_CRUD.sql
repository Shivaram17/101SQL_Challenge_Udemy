-- Question 3:
-- We learned in question 1 that 89 check constraints exist in the AdventureWorks Database. In this question we are going to determine what the check constraints are doing while creating a new database and table.

-- a. Create a new database called "Edited_AdventureWorks" (we are creating another database so we don't   overwrite or change the AdventureWorks database). Then write a USE statement to connect to the new database.

-- b. Using the following tables - sys.check_constraints, sys.tables, and sys.columns to write a query that will give you TableName, ColumnName, CheckConstraintName, and CheckConstraintDefinition

-- c. Create a table named "tbl_CheckConstraint" in the "Edited_AdventureWorks" database with the following  columns and data types:

-- TableName varchar(100)

-- ColumnName varchar(100)

-- CheckConsraint varchar(250)

-- Definition varchar(500)

-- ConstraintLevel varchar(100)

-- d. Using the query in part b insert the data into "tbl_CheckConstraint"

-- e. Using a case statement write an update statement (update ConstraintLevel) that will specify whether the constraint is assigned to the column or the table.

-- f. What does this mean?

-- g. Once you're done interpreting the results drop the tbl_CheckConstraint table



--a.
CREATE DATABASE Edited_AdventureWorks2019
USE Edited_AdventureWorks2019

SELECT * FROM AdventureWorks2019.sys.tables

--b 
SELECT 
t.name as TableName,
c.name as ColumnName,
cc.name as CheckConstraintName,
cc.definition as CheckConstrainDefiniton
FROM AdventureWorks2019.sys.check_constraints cc
INNER JOIN AdventureWorks2019.sys.tables t ON t.object_id = cc.parent_object_id
LEFT JOIN AdventureWorks2019.sys.columns c ON c.object_id = cc.parent_object_id
AND c.column_id = cc.parent_column_id

--c
CREATE TABLE tbl_CheckConstraint
(TableName varChar(100),
ColumnName varChar(100),
CheckConstraint varChar(250),
[Definition] varChar(500),
ConstraintLevel varChar(100)
) 

--d 
INSERT INTO tbl_CheckConstraint
(TableName,
ColumnName,
CheckConstraint,
[Definition],
ConstraintLevel)
	SELECT 
	t.name as TableName,
	c.name as ColumnName,
	cc.name as CheckConstraintName,
	cc.definition as CheckConstrainDefiniton,
	null as ConstraintLevel
	FROM AdventureWorks2019.sys.check_constraints cc
	INNER JOIN AdventureWorks2019.sys.tables t ON t.object_id = cc.parent_object_id
	LEFT JOIN AdventureWorks2019.sys.columns c ON c.object_id = cc.parent_object_id
	AND c.column_id = cc.parent_column_id

--e
UPDATE tbl_CheckConstraint
SET ConstraintLevel = Case When ColumnName is null
						THEN 'TableLevel'
						ELSE 'ColumnLevel'
						END

--f
--g
DROP TABLE tbl_CheckConstraint;
SELECT * FROM tbl_CheckConstraint
