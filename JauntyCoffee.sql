/* Creating Employee Table */
CREATE TABLE Employee 
(
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  hire_date DATE,
  job_title VARCHAR(30)
);

/* Creating Coffee Shop Table */
CREATE TABLE Coffee_Shop
(
  shop_id INT PRIMARY KEY,
  shop_name VARCHAR(50),
  city VARCHAR(50),
  state CHAR(2)
);

/* Creating Coffee Table */
CREATE TABLE Coffee
(
  coffee_id INT PRIMARY KEY,
  coffee_name VARCHAR(30),
  price_per_pound NUMERIC(5,2)
);

/* Creating Supplier Table */
CREATE TABLE Supplier
(
  supplier_id INT PRIMARY KEY,
  company_name VARCHAR(50),
  country VARCHAR(30),
  sales_contact_name VARCHAR(60),
  email VARCHAR(50) NOT NULL
);

/* Add Foreign Key for Shop ID to Employee table */
ALTER TABLE Employee
  ADD shop_id INT,
  ADD FOREIGN KEY(shop_id) REFERENCES Coffee_Shop(shop_id);
  
/* Add Foreign Key for Shop ID and Supplier ID to Coffee Table */
ALTER TABLE Coffee
  ADD shop_id INT,
  ADD supplier_id INT,
  ADD FOREIGN KEY(shop_id) REFERENCES Coffee_Shop(shop_id),
  ADD FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id);
  
/* Adding data to Employee table */
INSERT INTO Employee(employee_id, first_name, last_name, hire_date, job_title)
VALUES (1, 'Jeremy', 'Renner', '2018-06-05', 'Shift Manager'),
(2, 'Bruce', 'Wayne', '2020-03-24', 'Lead Barista'),
(3, 'Diane','Keaton','2016-01-02','Marketer');

/* Adding data to Coffee Shop table */
INSERT INTO Coffee_Shop(shop_id, shop_name, city, state)
Values (1, 'Cafe Chico', 'Laredo', 'TX'),
(2, 'Dutch Brothers','Phoenix','AZ'),
(3, 'The Coffee Bean', 'Arcadia', 'CA');

/* Adding data to Coffee table */

/* Adding data to Supplier table */
