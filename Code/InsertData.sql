use CordialSamba;

#每次执行初始化插入前清空表,防止重复插入相同数据。
SET FOREIGN_KEY_CHECKS = 0;  -- 禁用外键约束检查，禁用期间要避免破坏数据完整性的操作
truncate table orderdata;
truncate table order_detail;
truncate table reservation;
TRUNCATE TABLE customer; 
TRUNCATE TABLE employee;
TRUNCATE TABLE dish;
SET FOREIGN_KEY_CHECKS = 1;  -- 重新启用外键约束检查


insert into customer (customer_name, phone, is_member, register_date) values 
('Alan Turing', '13800138001', true, '2023-01-15'),
('Ada Lovelace', '13800138002', FALSE, '2023-02-20'),
('Tim Berners-Lee', '13800138003', TRUE, '2023-03-10'),
('Grace Hopper', '13800138004', FALSE, '2023-04-05'),
('Linus Torvalds', '13800138005', TRUE, '2023-05-12');



INSERT INTO dish (dish_name, price, dish_status) VALUES
('BCNF Steak', 88.00, 'Available'),
('Cartesian Product Fired Rice', 38.00, 'Available'),
('Atomic Sushi', 128.00, 'Available'),
('Canonical Cover Salad', 48.00, 'SoldOut'),
('NoSQL Pizza', 68.00, 'Available');


INSERT INTO employee (employee_name, position, salary) VALUES
('Albert Einstein', 'Chef', 12000.00),
('Marie Curie', 'Chef', 11500.00),
('Nikola Tesla', 'Waiter', 6500.00),
('Rosalind Franklin', 'Waiter', 6200.00),
('Richard Feynman', 'Waiter', 6800.00);



INSERT INTO orderdata (customer_id, employee_id, order_time, total_amount) VALUES
(1, 3, '2023-06-01 12:30:00', 126.00),
(2, 4, '2023-06-02 13:15:00', 38.00),
(3, 5, '2023-06-03 18:45:00', 216.00),
(4, 3, '2023-06-04 19:30:00', 156.00),
(5, 4, '2023-06-05 20:00:00', 68.00);


INSERT INTO order_detail (order_id, dish_id, quantity) VALUES
(1, 1, 1), (1, 3, 1),
(2, 2, 1),
(3, 1, 2), (3, 3, 1),
(4, 1, 1), (4, 5, 1),
(5, 5, 1);



INSERT INTO reservation (customer_id, reservation_time, reservation_record_time, party_size) VALUES
(1, '2023-06-10 18:00:00', '2023-06-01 10:00:00', 4),
(2, '2023-06-11 19:30:00', '2023-06-02 11:30:00', 2),
(3, '2023-06-12 20:00:00', '2023-06-03 09:15:00', 6),
(4, '2023-06-13 17:45:00', '2023-06-04 14:20:00', 3),
(5, '2023-06-14 19:00:00', '2023-06-05 16:00:00', 5);








