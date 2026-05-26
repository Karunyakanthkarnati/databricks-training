CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100),
department VARCHAR(50),
city VARCHAR(50),
salary VARCHAR(20),
remarks VARCHAR(200)
);

INSERT INTO employees VALUES
(1, 'Karthik Kondpak', 'karthik.k@gmail.com', 'Data Engineering', 'Hyderabad', '75000', ' Top performer '),
(2, 'Veena Reddy', 'veena_r@company.com', 'Analytics', 'Bangalore', '65000', 'Excellent communication'),
(3, 'Ravi kumar', 'ravi.kumar@org.in', 'Data Science', 'Chennai', '85000', 'Needs improvement'),
(4, 'Anil', 'anil@abc.com', 'DEVOPS', 'Pune', '70000', NULL),
(5, ' Suresh ', 'suresh@xyz.com', 'data engineering', ' hyderabad ', '60000', ' ');
