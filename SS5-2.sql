CREATE DATABASE IF NOT EXISTS baitap_groupby_having;

USE baitap_groupby_having;

CREATE TABLE employees (
    emp_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(15,0)
);

DESCRIBE employees;

INSERT INTO employees
    (emp_id, full_name, department, salary)
VALUES
    ('E001', 'Nguyen Van An', 'IT', 15000000),
    ('E002', 'Tran Thi Binh', 'IT', 14000000),
    ('E003', 'Le Minh Chau', 'IT', 13000000),
    ('E004', 'Pham Ngoc Dung', 'IT', 12000000),

    ('E005', 'Hoang Gia Huy', 'HR', 10000000),
    ('E006', 'Nguyen Thi Lan', 'HR', 11000000),

    ('E007', 'Tran Van Minh', 'Sales', 11000000),
    ('E008', 'Le Thi Hoa', 'Sales', 13000000),
    ('E009', 'Pham Van Nam', 'Sales', 14000000);
    
SELECT * FROM employees;
-- Mỗi phòng ban có bao nhiêu nhân viên
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Lương trung bình của từng phòng ban
SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Phòng ban có trên 3 nhân viên
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- Phòng ban có lương trung bình lớn hơn 12.000.000
SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;