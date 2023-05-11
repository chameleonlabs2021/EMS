CREATE DATABASE employee_db;


-- Employees table
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_title VARCHAR(50),
  department VARCHAR(50)
);




-- Sample data for employees table
INSERT INTO employees (first_name, last_name, job_title, department) 
VALUES 
('John', 'Doe', 'Sales Manager', 'Sales'),
('Jane', 'Doe', 'Marketing Manager', 'Marketing'),
('Bob', 'Smith', 'IT Manager', 'IT');

-- Employee Contact Information table
CREATE TABLE employee_contact_information (
  employee_id INT PRIMARY KEY,
  address VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(50),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);

-- Sample data for employee_contact_information table
INSERT INTO employee_contact_information (employee_id, address, phone_number, email) 
VALUES 
(1, '123 Main St, Anytown, USA', '555-555-1234', 'john.doe@company.com'),
(2, '456 Oak St, Anytown, USA', '555-555-5678', 'jane.doe@company.com'),
(3, '789 Elm St, Anytown, USA', '555-555-9101', 'bob.smith@company.com');
