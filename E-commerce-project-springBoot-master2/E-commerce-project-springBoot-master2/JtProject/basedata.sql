-- SQL configs
SET SQL_MODE = 'IGNORE_SPACE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- create database and use it
CREATE DATABASE IF NOT EXISTS ecommjava;
USE ecommjava;

-- create the category table
CREATE TABLE IF NOT EXISTS CATEGORY (
    category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NULL
);

-- create the customer table
CREATE TABLE IF NOT EXISTS CUSTOMER (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    address VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    role VARCHAR(255) NULL,
    username VARCHAR(255) NOT NULL UNIQUE
);

-- create the product table
CREATE TABLE IF NOT EXISTS PRODUCT (
    product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    description VARCHAR(255) NULL,
    image VARCHAR(255) NULL,
    name VARCHAR(255) NULL,
    price INT NULL,
    quantity INT NULL,
    weight INT NULL,
    category_id INT NULL,
    customer_id INT NULL,
    CONSTRAINT FK_CATEGORY FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id) ON DELETE SET NULL,
    CONSTRAINT FK_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id) ON DELETE SET NULL
);

-- create indexes (no son necesarios si ya existen FOREIGN KEYS)
CREATE INDEX IDX_CATEGORY ON PRODUCT (category_id);
CREATE INDEX IDX_CUSTOMER ON PRODUCT (customer_id);