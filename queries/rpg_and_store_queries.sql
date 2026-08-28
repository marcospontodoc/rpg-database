CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER store_database_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'localhost',
    port '5432',
    dbname 'store_database'
);

CREATE USER MAPPING FOR postgres
SERVER store_database_server
OPTIONS (
    user 'postgres',
    password 'SUA_SENHA'
);

CREATE FOREIGN TABLE store_order_remote (
    id_order INT,
    id_player INT,
    order_date TIMESTAMP,
    status VARCHAR(20),
    total NUMERIC(10,2)
)
SERVER store_database_server
OPTIONS (
    schema_name 'public',
    table_name 'store_order'
);

SELECT *
FROM store_order_remote;

SELECT
    p.name AS player_name,
    o.id_order,
    o.status,
    o.total
FROM player p
JOIN store_order_remote o
    ON p.id_player = o.id_player;

SELECT
    p.name AS player_name,
    SUM(o.total) AS total_spent
FROM player p
JOIN store_order_remote o
    ON p.id_player = o.id_player
WHERE o.status = 'COMPLETED'
GROUP BY p.id_player, p.name
ORDER BY total_spent DESC;