CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,

    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE product (
    id_product SERIAL PRIMARY KEY,

    id_category INT NOT NULL,

    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,

    CONSTRAINT fk_product_category
        FOREIGN KEY (id_category)
        REFERENCES category(id_category)
        ON DELETE RESTRICT,

    CONSTRAINT chk_product_price
        CHECK (price >= 0),

    CONSTRAINT chk_product_stock
        CHECK (stock >= 0)
);

CREATE TABLE store_order (
    id_order SERIAL PRIMARY KEY,

    id_player INT NOT NULL,

    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    total NUMERIC(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT chk_order_status
        CHECK (
            status IN (
                'PENDING',
                'COMPLETED',
                'CANCELLED'
            )
        ),

    CONSTRAINT chk_order_total
        CHECK (total >= 0)
);

CREATE TABLE order_item (
    id_order INT NOT NULL,
    id_product INT NOT NULL,

    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,

    CONSTRAINT pk_order_item
        PRIMARY KEY (id_order, id_product),

    CONSTRAINT fk_order_item_order
        FOREIGN KEY (id_order)
        REFERENCES store_order(id_order)
        ON DELETE CASCADE,

    CONSTRAINT fk_order_item_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE RESTRICT,

    CONSTRAINT chk_order_item_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_order_item_unit_price
        CHECK (unit_price >= 0)
);