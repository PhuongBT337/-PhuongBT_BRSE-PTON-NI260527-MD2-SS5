USE baitap_insert_select;

DESCRIBE students;

CREATE DATABASE baitap_ham_sql;

USE baitap_ham_sql;

SELECT DATABASE();

CREATE TABLE students (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year YEAR,
    gender VARCHAR(10),
    score DECIMAL(3,1)
);

DESCRIBE students;


INSERT INTO students
    (student_id, full_name, birth_year, gender, score)
VALUES
    ('SV001', 'Nguyen Van An', 2004, 'Nam', 7.8),
    ('SV002', 'Tran Thi Binh', 2005, 'Nữ', 8.6),
    ('SV003', 'Le Minh Chau', 2003, 'Nam', 6.9),
    ('SV004', 'Pham Ngoc Dung', 2005, 'Nữ', 9.2),
    ('SV005', 'Hoang Gia Huy', 2004, 'Nam', 7.4);
    
SELECT * FROM students;

-- Mã sinh viên + họ tên viết hoa
SELECT student_id, UPPER(full_name) AS full_name
FROM students;

-- Họ tên + số tuổi
SELECT full_name,
       YEAR(CURDATE()) - birth_year AS age
FROM students;

-- Điểm trung bình làm tròn 1 chữ số thập phân
SELECT ROUND(AVG(score), 1) AS average_score
FROM students;

-- Tổng số sinh viên + điểm cao nhất + điểm thấp nhất
SELECT COUNT(*) AS total_students,
       MAX(score) AS highest_score,
       MIN(score) AS lowest_score
FROM students;