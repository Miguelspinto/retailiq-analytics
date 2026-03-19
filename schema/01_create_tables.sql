CREATE TABLE customers (
    customer_id        VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    zip_code           VARCHAR(10),
    city               VARCHAR(100),
    state              VARCHAR(5)
);

CREATE TABLE sellers (
    seller_id          VARCHAR(50) PRIMARY KEY,
    zip_code           VARCHAR(10),
    city               VARCHAR(100),
    state              VARCHAR(5)
);

CREATE TABLE products (
    product_id               VARCHAR(50) PRIMARY KEY,
    category_name            VARCHAR(100),
    name_length              INTEGER,
    description_length       INTEGER,
    photos_qty               INTEGER,
    weight_g                 INTEGER,
    length_cm                INTEGER,
    height_cm                INTEGER,
    width_cm                 INTEGER
);

CREATE TABLE orders (
    order_id                VARCHAR(50) PRIMARY KEY,
    customer_id             VARCHAR(50) REFERENCES customers(customer_id),
    order_status            VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at        TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE order_items (
    order_id             VARCHAR(50) REFERENCES orders(order_id),
    order_item_id        INTEGER,
    product_id           VARCHAR(50) REFERENCES products(product_id),
    seller_id            VARCHAR(50) REFERENCES sellers(seller_id),
    shipping_limit_date  TIMESTAMP,
    price                DECIMAL(10,2),
    freight_value        DECIMAL(10,2)
);

CREATE TABLE order_payments (
    order_id             VARCHAR(50) REFERENCES orders(order_id),
    payment_sequential   INTEGER,
    payment_type         VARCHAR(20),
    payment_installments INTEGER,
    payment_value        DECIMAL(10,2)
);

CREATE TABLE order_reviews (
    review_id              VARCHAR(50),
    order_id               VARCHAR(50) REFERENCES orders(order_id),
    review_score           INTEGER,
    review_comment_title   VARCHAR(100),
    review_comment_message TEXT,
    review_creation_date   TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);