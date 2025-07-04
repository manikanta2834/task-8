-- MySQL Stored Procedure and Function Examples

-- 1. Create a database and table for demonstration
CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    join_date DATE NOT NULL
);

-- Insert sample data
INSERT INTO employees (name, department, salary, join_date) VALUES
('John Doe', 'IT', 75000.00, '2020-05-15'),
('Jane Smith', 'HR', 65000.00, '2019-11-20'),
('Mike Johnson', 'Finance', 82000.00, '2021-02-10'),
('Sarah Williams', 'IT', 78000.00, '2020-08-05'),
('David Brown', 'Marketing', 70000.00, '2022-01-15');

-- 2. Create a stored procedure to get employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(IN dept_name VARCHAR(50))
BEGIN
    SELECT id, name, salary, join_date 
    FROM employees 
    WHERE department = dept_name
    ORDER BY salary DESC;
END //
DELIMITER ;

-- 3. Create a function to calculate annual bonus
DELIMITER //
CREATE FUNCTION CalculateAnnualBonus(emp_id INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10, 2);
    DECLARE emp_salary DECIMAL(10, 2);
    DECLARE emp_join_date DATE;
    DECLARE years_served INT;
    
    -- Get employee details
    SELECT salary, join_date INTO emp_salary, emp_join_date
    FROM employees WHERE id = emp_id;
    
    -- Calculate years served
    SET years_served = YEAR(CURRENT_DATE) - YEAR(emp_join_date);
    IF MONTH(CURRENT_DATE) < MONTH(emp_join_date) OR 
       (MONTH(CURRENT_DATE) = MONTH(emp_join_date) AND DAY(CURRENT_DATE) < DAY(emp_join_date)) THEN
        SET years_served = years_served - 1;
    END IF;
    
    -- Calculate bonus (5% of salary + 1% for each year served)
    SET bonus = emp_salary * (0.05 + (years_served * 0.01));
    
    RETURN bonus;
END //
DELIMITER ;
SELECT * FROM employees;	
-- 4. Create a procedure to update salaries with a percentage increase
DELIMITER //
CREATE PROCEDURE UpdateSalariesByDepartment(
    IN dept_name VARCHAR(50),
    IN increase_percent DECIMAL(5, 2),
    OUT employees_updated INT
)
BEGIN
    UPDATE employees 
    SET salary = salary * (1 + increase_percent/100)
    WHERE department = dept_name;
    
    SET employees_updated = ROW_COUNT();
END //
DELIMITER ;

-- Example calls
-- Call the procedure
CALL GetEmployeesByDepartment('IT');

-- Call the function
SELECT name, salary, CalculateAnnualBonus(id) AS annual_bonus FROM employees;

-- Call the procedure with OUT parameter
CALL UpdateSalariesByDepartment('IT', 5.0, @updated_count);
SELECT @updated_count AS employees_updated;












