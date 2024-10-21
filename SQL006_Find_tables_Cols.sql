-- QUESTION 6
--Question 6
--In Question 1 we learned that the AdventureWorks Database has 152 Default Constraints. What tables and columns are these constraints on? And what are the default values?

SELECT 
	s.name as SchemaName,
	t.name as TableName,
	c.name as ColumnName,
	dc.name as DefaultConstraint,
	dc.definition as DefaultDefinition
FROM sys.default_constraints dc
	INNER JOIN sys.tables t on t.object_id = dc.parent_object_id
	INNER JOIN sys.schemas s on s.schema_id = dc.schema_id
	INNER JOIN sys.columns c on c.column_id = dc.parent_column_id AND 
	c.object_id = dc.parent_object_id;
