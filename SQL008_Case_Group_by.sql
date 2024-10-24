/*Question 8
In Question 2 we were introduced to the information_schema schema, specifically the information_schema.columns table.

a. Use this table to get a count of each data type in the AdventureWorks Database (include the view tables). Which data type is used the most?
*/
SELECT
Data_Type,
Count(*) as DataTypeCNT
FROM Information_Schema.Columns
Group by Data_Type
Order by 2 desc;


/*
b. Using a case statement create a data type grouping that summarizes each data type as one of the following Groups:

Character

Numeric

Date

Null

Use the following columns to create these groups:

Character_Maximum_Length

Numeric_Precision

DateTime_Precision

For example, when the Character_Maximum_Length is not null then the data type group is "Character." If a row is    null in all three columns then put it in the "Null" group.

Then give a count of data types in each grouping. The final output will only have two columns - "DataTypeGroup" and "DataTypeCNT." Lastly, order by count desc
*/
SELECT 
CASE WHEN Character_Maximum_length is not null then 'Character'
WHEN Numeric_Precision is not null THEN 'Numeric'
WHEN Datetime_Precision is not null THEN 'Date'
ELSE null
END as 'DataTypeGroup',
COUNT(*) AS CNT
FROM Information_Schema.Columns
GROUP BY
CASE WHEN Character_Maximum_Length is not null THEN 'Character'
WHEN Numeric_Precision is not null THEN 'Numeric'
WHEN Datetime_Precision is not null then 'Date'
ELSE null
END
ORDER BY COUNT(*) DESC;

--C.


/*
c. What data types are in the "Null" group*/
SELECT * 
FROM Information_Schema.Columns
Where Character_Maximum_Length is null
and Numeric_Precision is null
and Datetime_Precision is null;

