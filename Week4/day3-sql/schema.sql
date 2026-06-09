CREATE TABLE departments (

    dept_id INT PRIMARY KEY,

    dept_name VARCHAR(50)

);
 
CREATE TABLE employees (

    emp_id INT PRIMARY KEY,

    emp_name VARCHAR(100),

    dept_id INT,

    salary DECIMAL(10,2),

    hire_date DATE,

    manager_id INT,

    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)

);
 
CREATE TABLE customers (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100),

    city VARCHAR(50)

);
 
CREATE TABLE orders (

    order_id INT PRIMARY KEY,

    customer_id INT,

    order_date DATE,

    amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);
 
INSERT INTO departments VALUES

(1,'Engineering'),

(2,'Data'),

(3,'Finance'),

(4,'HR'),

(5,'Sales');
 
 
INSERT INTO employees VALUES

(101,'John',1,120000,'2018-01-15',NULL),

(102,'Mike',1,95000,'2019-03-10',101),

(103,'David',1,90000,'2021-06-20',101),
 
(104,'Sarah',2,140000,'2017-08-25',NULL),

(105,'Priya',2,110000,'2020-02-14',104),

(106,'Ravi',2,105000,'2022-01-10',104),

(107,'Anil',2,85000,'2023-05-12',105),
 
(108,'Emma',3,125000,'2016-11-18',NULL),

(109,'Robert',3,85000,'2020-04-21',108),
 
(110,'Sophia',4,95000,'2021-09-11',NULL),

(111,'Chris',4,65000,'2024-01-15',110),
 
(112,'James',5,130000,'2018-12-05',NULL),

(113,'Linda',5,100000,'2019-10-10',112),

(114,'Kevin',5,95000,'2022-03-15',112),

(115,'Nancy',5,75000,'2024-06-01',113);
 
 
INSERT INTO customers VALUES

(1,'Amazon','Hyderabad'),

(2,'Google','Bangalore'),

(3,'Microsoft','Hyderabad'),

(4,'Netflix','Mumbai'),

(5,'Meta','Delhi'),

(6,'Adobe','Pune'),

(7,'Amazon','Hyderabad');
 
 
 
INSERT INTO orders VALUES

(1001,1,'2024-01-05',25000),

(1002,2,'2024-01-10',45000),

(1003,1,'2024-02-02',30000),

(1004,3,'2024-02-15',55000),

(1005,2,'2024-03-01',70000),

(1006,4,'2024-03-18',15000),

(1007,1,'2024-04-10',45000),

(1008,5,'2024-04-25',85000),

(1009,3,'2024-05-05',35000),

(1010,6,'2024-05-20',40000),

(1011,2,'2024-06-10',95000),

(1012,5,'2024-06-15',25000),

(1013,1,'2024-07-01',60000),

(1014,4,'2024-07-08',20000),

(1015,2,'2024-08-10',55000),

(1016,3,'2024-08-15',65000),

(1017,5,'2024-09-01',45000),

(1018,1,'2024-09-20',50000),

(1019,6,'2024-10-05',30000),

(1020,2,'2024-10-22',80000);
