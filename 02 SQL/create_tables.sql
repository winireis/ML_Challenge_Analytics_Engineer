-- SQL code for PostgreSQL
CREATE TABLE Customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  nickname VARCHAR(255),
  email VARCHAR(255),
  telephone VARCHAR(255),
  gender VARCHAR(255),
  birthdate DATE,
  address VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE Categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Items (
  id SERIAL PRIMARY KEY,
  category_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Orders (
  id SERIAL PRIMARY KEY,
  buyer_id INT NOT NULL,
  seller_id INT NOT NULL,
  date DATE,
  FOREIGN KEY (buyer_id) REFERENCES Customers(id),
  FOREIGN KEY (seller_id) REFERENCES Customers(id)
);

CREATE TABLE OrderItems (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL,
  item_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(id),
  FOREIGN KEY (item_id) REFERENCES Items(id)
);

-- Indexes for Customers table
CREATE INDEX idx_customers_name ON Customers(name);
CREATE INDEX idx_customers_email ON Customers(email);

-- Indexes for Categories table
CREATE INDEX idx_categories_name ON Categories(name);

-- Indexes for Items table
CREATE INDEX idx_items_category_id ON Items(category_id);
CREATE INDEX idx_items_name ON Items(name);

-- Indexes for Orders table
CREATE INDEX idx_orders_buyer_id ON Orders(buyer_id);
CREATE INDEX idx_orders_seller_id ON Orders(seller_id);
CREATE INDEX idx_orders_date ON Orders(date);

-- Indexes for OrderItems table
CREATE INDEX idx_orderitems_order_id ON OrderItems(order_id);
CREATE INDEX idx_orderitems_item_id ON OrderItems(item_id);