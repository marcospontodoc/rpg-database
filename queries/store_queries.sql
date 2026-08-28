SELECT
    name,
    price
FROM product
ORDER BY price DESC;

SELECT
    name,
    stock
FROM product
WHERE stock < 30
ORDER BY stock;

SELECT
    p.name AS product_name,
	SUM(oi.quantity) AS total_sold
FROM order_item oi
JOIN product p
	ON oi.id_product = p.id_product
GROUP BY p.id_product, p.name
ORDER BY total_sold DESC;

