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
INSERT INTO Coffee(coffee_id, coffee_name, price_per_pound)
VALUES (1, 'Cabana Nights', 15.25),
(2, 'Dark Blonde' , 12.95),
(3, 'Verrado Blend' , 11.25);

/* Adding data to Supplier table */
INSERT INTO Supplier(supplier_id, company_name, country, sales_contact_name, email)
VALUES (1, 'Bean Barons LLC.', 'United States of America', "Pedro Pascal", "mando20@beanbarons.com"),
(2, "Best Coffee Inc.", "Philippines", "Candice Sanchez", 'csanchez@bestcoffee.com'),
(3, "Imported Flavor", "Canada", 'John Mayer', 'jmayer2@importedflavor.com');

/* Set Shop ID for each employee */
UPDATE Employee
SET shop_id = 1
WHERE employee_id = 1;

UPDATE Employee
SET shop_id = 2
WHERE employee_id = 2;

UPDATE Employee
SET shop_id = 3
WHERE employee_id = 3;

/* Set shop and supplier ID for each coffee */
UPDATE Coffee
SET shop_id = 1 , supplier_id = 1
WHERE coffee_id = 3;

UPDATE Coffee
SET shop_id = 2 , supplier_id = 2
WHERE coffee_id = 1;

UPDATE Coffee
SET shop_id = 3 , supplier_id = 3
WHERE coffee_id = 2;

/* Creating a view and concatenating employee's name */
CREATE VIEW concat_names AS
SELECT CONCAT(first_name, ' ', last_name) AS employee_full_name, employee_id, hire_date, job_title, shop_id
FROM Employee
WHERE first_name IS NOT NULL AND last_name IS NOT NULL;

/* Creating an index with the coffee_name field */
CREATE INDEX coffee_index
ON Coffee (coffee_name);

/* Creating a SFW query for Coffee Shop table */
SELECT * FROM Coffee_Shop
Where state = 'AZ';

/* Creating a query to join three tables and include all attributes */
SELECT * FROM Employee
JOIN Coffee_Shop
ON Employee.shop_id = Coffee_Shop.shop_id
JOIN Coffee
ON Coffee_Shop.shop_id = Coffee.shop_id
