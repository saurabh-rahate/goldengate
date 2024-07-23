CONNECT OGGADMIN/Admin11@XEPDB1
CREATE TABLE customers (customer_id INT PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, email VARCHAR(100));
INSERT INTO customers VALUES (12, 'John', 'Doe', 'john11.doe@example.com');
INSERT INTO customers VALUES (21, 'Jane', 'Smith', 'jane1.smith@example.com');
INSERT INTO customers VALUES (31, 'Alice', 'Johnson', 'alice1.johnson@example.com');
COMMIT;