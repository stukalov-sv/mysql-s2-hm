/* 1.
Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому заданию
 */

DROP DATABASE IF EXISTS lesson_2_hm;
CREATE DATABASE lesson_2_hm;
USE lesson_2_hm;

DROP TABLE IF EXISTS mobilephones;
CREATE TABLE sales
(   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales (order_date,count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

/* 2.
Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
От 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

SELECT id,
CASE
    WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product >= 100 AND count_product < 300 THEN 'Средний заказ'
    ELSE 'Большой заказ'
    END AS 'Order_value'
FROM sales;

/* 3.
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; 
CLOSED - «Order is closed»; 
CANCELLED - «Order is cancelled» (if*,case).
*/

CREATE TABLE orders
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20) NOT NULL UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(20)
);

INSERT orders (employee_id, amount, order_status)
VALUES
    ('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT id, employee_id, amount,
CASE
WHEN order_status = 'OPEN' THEN 'Order is in open state'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;
