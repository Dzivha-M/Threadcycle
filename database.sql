CREATE DATABASE IF NOT EXISTS threadcycle;
USE threadcycle;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS listings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL,
    item_condition VARCHAR(50) DEFAULT 'Good',
    status VARCHAR(50) DEFAULT 'APPROVED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES users(id)
);

-- Insert Dummy Data
INSERT INTO users (name, email) VALUES ('Alex Rivers', 'alex@example.com');
INSERT INTO listings (seller_id, title, description, price, category, item_condition, status) VALUES 
(1, 'Vintage Denim Jacket', 'Classic blue denim jacket, slightly worn but in great shape.', 450.00, 'Jackets', 'Good', 'APPROVED'),
(1, 'Running Sneakers', 'Barely used running shoes, size 10.', 800.50, 'Footwear', 'Excellent', 'APPROVED');