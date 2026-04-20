
CREATE DATABASE IF NOT EXISTS artikels;
USE artikels;

CREATE TABLE IF NOT EXISTS aritkel (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    preis DECIMAL(10,2)
);