
CREATE TABLE public.categories (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE public.customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    signup_date DATE
);

CREATE TABLE public.products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(150),
    category_id INTEGER REFERENCES public.categories(category_id),
    unit_cost NUMERIC(10,2),
    list_price NUMERIC(10,2)
);

CREATE TABLE public.orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES public.customers(customer_id),
    order_date DATE,
    status VARCHAR(50)
);

CREATE TABLE public.order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES public.orders(order_id),
    product_id INTEGER REFERENCES public.products(product_id),
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    unit_cost NUMERIC(10,2)
);
