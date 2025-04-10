create database PIZZAMANIA;

use PIZZAMANIA;

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(20) PRIMARY KEY,
    pizza_name VARCHAR(50),
    category VARCHAR(20),
    ingredients VARCHAR(255)
);

CREATE TABLE pizzas (
    pizza_id VARCHAR(20) PRIMARY KEY,
    pizza_type_id VARCHAR(20),
    size VARCHAR(20),
    price DOUBLE,
    FOREIGN KEY (pizza_type_id)
        REFERENCES pizza_types (pizza_type_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date VARCHAR(20),
    time VARCHAR(20)
);

CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(20),
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (pizza_id)
        REFERENCES pizzas (pizza_id)
);