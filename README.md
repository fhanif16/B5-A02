# PostgreSQL Basics
This document provides a quick overview of fundamental PostgreSQL concepts and SQL features.
### 1. What is PostgreSQL?
PostgreSQL is a powerful, open-source object-relational database management system (ORDBMS). It uses and extends the SQL language and provides many advanced features to safely store, query, and manage structured data.

### 2.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**Primary Key**
A Primary Key is a column (or a set of columns) that uniquely identifies each row in a table. It ensures that no duplicate or NULL values exist in the key column.

**Foreign Key**
A Foreign Key is a column (or group of columns) in one table that refers to the Primary Key in another table. It is used to establish a relationship between the two tables.

Example:

Table: Employees

emp_id (Primary Key)

Table: Department

emp_id (Foreign Key referring to Employees.emp_id)

### 3.What is the difference between the VARCHAR and CHAR data types?

**VARCHAR** is a data type in SQL that is used to store character strings of variable length. If the length of the input is less than the specified maximum length, it stores the string as-is without padding it with extra blank spaces.
**CHAR** is a data type in SQL that is used to store character strings of fixed length. If the input string is shorter than the specified length, it is padded with extra blank spaces to make the total length equal to the defined fixed length.

### 4. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

A JOIN clause is used to combine rows from two or more tables based on a related column between them. Typically, it connects the primary key of the first table with the foreign key of the second table. JOINs help reduce data duplication, allow for writing complex queries, and are essential for retrieving meaningful data spread across multiple tables.
There are several types of JOINs:
**INNER JOIN**:
 Returns only the rows that have matching values in both tables.


**LEFT JOIN (or LEFT OUTER JOIN)**:
 Returns all rows from the left table and the matched rows from the right table. If there is no match, NULL is returned for columns from the right table.


**RIGHT JOIN (or RIGHT OUTER JOIN)**:
 Returns all rows from the right table and the matched rows from the left table. If there is no match, NULL is returned for columns from the left table.


**FULL JOIN (or FULL OUTER JOIN)**:
 Returns all rows when there is a match in either the left or right table. If there is no match, NULL is returned for missing matches on either side.

 ## 5.Explain the purpose of the WHERE clause in a SELECT statement.
 The WHERE clause is used to filter records. It extracts only those records that fulfill a specified condition. It helps narrow down the result set by applying logical conditions to the data in a table.
For example:


SELECT * FROM employees  
WHERE name = 'Fatema';


This query will return only the data of employees whose name is **Fatema**.










