# task-8
sql internship
# SQL Developer Internship - Task 8 Solution

This repository contains solutions for Task 8 of the SQL Developer Internship, demonstrating stored procedures and functions in both MySQL and SQLite.

## Contents

1. `mysql_solution.sql` - Complete implementation using MySQL syntax with:
   - Stored procedure to get employees by department
   - Function to calculate annual bonus
   - Stored procedure with OUT parameter to update salaries

2. `sqlite_solution.sql` - Implementation approaches for SQLite (which doesn't natively support stored procedures/functions) showing:
   - Views as an alternative to procedures
   - SQL logic that would be implemented in application code for functions
   - Parameterized queries for data modification

## Key Concepts Demonstrated

- **Stored Procedures**: Reusable blocks of SQL code that can accept parameters
- **Functions**: SQL routines that return a value and can be used in SQL statements
- **Parameters**: IN parameters for input, OUT parameters for returning values
- **Conditional Logic**: Used in the bonus calculation function
- **Modularity**: Breaking down complex operations into reusable components

## Answers to Interview Questions

1. **Difference between procedure and function?**  
   Procedures perform actions and may return multiple values via OUT parameters. Functions return a single value and can be used in SQL statements.

2. **What is IN/OUT parameter?**  
   IN parameters are for input to the procedure/function. OUT parameters are for returning values from procedures.

3. **Can functions return tables?**  
   In some DBMS like SQL Server, yes (table-valued functions). In MySQL/SQLite, functions return scalar values.

4. **What is RETURN used for?**  
   In functions, RETURN specifies the value to be returned. In procedures, it's typically not used.

5. **How to call stored procedures?**  
   In MySQL: `CALL procedure_name(params)`. In SQLite, typically through application code.

6. **What is the benefit of stored routines?**  
   Code reuse, improved performance (precompiled), security (can restrict direct table access), and reduced network traffic.

7. **Can procedures have loops?**  
   Yes, most DBMS support loops (WHILE, REPEAT, FOR) in stored procedures.

8. **Difference between scalar and table-valued functions?**  
   Scalar functions return a single value, table-valued functions return a result set.

9. **What is a trigger?**  
   A trigger is a stored procedure that automatically executes when a specified database event occurs.

10. **How to debug stored procedures?**  
    Methods include: Using DBMS-specific debugging tools, logging with temporary tables, or step-by-step execution in development environments.
