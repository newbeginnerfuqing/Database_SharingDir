use CordialSamba;

CREATE TABLE customer 
(
    customer_id 	INT AUTO_INCREMENT,
    customer_name 	VARCHAR(50) NOT NULL,
    phone 			VARCHAR(15) UNIQUE,
    is_member 		BOOLEAN DEFAULT FALSE,
    register_date 	DATE DEFAULT (CURRENT_DATE),
    
    primary key (customer_id)
);


CREATE TABLE dish 
(
    dish_id 		INT AUTO_INCREMENT,
    dish_name 		VARCHAR(100) NOT NULL,
    price 			DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    dish_status 	VARCHAR(10) NOT NULL CHECK (dish_status IN ('Available', 'SoldOut')),
    
    primary key (dish_id)
);


CREATE TABLE employee 
(
    employee_id 		INT AUTO_INCREMENT,
    employee_name 		VARCHAR(50) NOT NULL,
    position 			VARCHAR(10) NOT NULL CHECK (position IN ('Waiter', 'Chef')),
    salary 				DECIMAL(10,2) CHECK (salary >= 0),
    
    primary key (employee_id)
);


CREATE TABLE orderdata
(
    order_id 		INT AUTO_INCREMENT,
    customer_id 	INT NOT NULL,
    employee_id 	INT NOT NULL,
    order_time 		DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount 	DECIMAL(10,2) CHECK (total_amount >= 0),
    
    primary key (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);


CREATE TABLE order_detail (
    detail_id 	INT AUTO_INCREMENT,
    order_id 	INT NOT NULL,
    dish_id 	INT NOT NULL,
    quantity 	INT NOT NULL CHECK (quantity >= 1),
    
    primary key (detail_id),
    FOREIGN KEY (order_id) REFERENCES orderdata(order_id) ON DELETE CASCADE,
    FOREIGN KEY (dish_id) REFERENCES dish(dish_id) ON DELETE RESTRICT,
    UNIQUE (order_id, dish_id)  -- prevent keep adding same dishes in one order
);


CREATE TABLE reservation (
    reservation_id 				INT AUTO_INCREMENT,
    customer_id 				INT NOT NULL,
    reservation_time 			DATETIME NOT NULL,
    reservation_record_time 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    party_size 					INT NOT NULL CHECK (party_size > 0),
    
    primary key (reservation_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CHECK (reservation_time > reservation_record_time)
);





