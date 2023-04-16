use optimized_supply_chain;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE customer_contacts (
    customer_id INT PRIMARY KEY,
    contact_type VARCHAR(255),
    contact_info VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255),
    location_state VARCHAR(255),
    location_zip VARCHAR(255)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    inventory_name VARCHAR(255),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE inventory_stocks (
    inventory_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (inventory_id, product_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    actual_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    expiry_date DATE,
    total_quantity INT
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE supplies (
    supplier_id INT,
    product_id INT,
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE purchase_orders (
    purchase_id INT PRIMARY KEY,
    supplier_id INT,
    product_id INT,
    purchase_quantity INT,
    unit_price DECIMAL(10,2),
    order_date DATE,
    delivery_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    inventory_id INT,
    order_date DATETIME,
    product_id INT,
    selling_price DECIMAL(10,2),
    quantity_ordered INT,
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE customer_orders (
    order_id INT,
    customer_id INT,
    PRIMARY KEY (order_id, customer_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    sale_quantity INT,
    sale_amount DECIMAL(10,2),
    profit_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);