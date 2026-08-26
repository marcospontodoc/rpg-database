INSERT INTO category (name, description)
VALUES
    ('Weapons', 'Various types of weapons for combat'),
    ('Armor', 'Protective gear to reduce damage taken'),
    ('Consumables', 'Items that can be consumed for various effects'),
    ('Accessories', 'Items that provide additional benefits or enhancements');

INSERT INTO product (id_category, name, description, price, stock)
VALUES
    (1, 'Sword of Valor', 'A legendary sword that grants immense power to its wielder.', 150.00, 10),
    (1, 'Staff of Wisdom', 'A mystical staff that enhances magical abilities.', 120.00, 15),
    (1, 'Bow of Precision', 'A finely crafted bow that improves accuracy.', 100.00, 20),
    (1, 'Dagger of Shadows', 'A stealthy dagger that allows for silent attacks.', 80.00, 25),
    (2, 'Shield of Fortitude', 'A sturdy shield that provides excellent defense.', 90.00, 12),
    (2, 'Helmet of Insight', 'A helmet that grants enhanced perception and awareness.', 70.00, 18),
    (3, 'Potion of Healing', 'A potion that restores health when consumed.', 10.00, 50),
    (3, 'Elixir of Strength', 'An elixir that temporarily increases physical strength.', 15.00, 40),
    (4, 'Amulet of Protection', 'An amulet that provides magical protection against harm.', 75.00, 22);

INSERT INTO store_order (id_player, status, total)
VALUES
    (1, 'COMPLETED', 1050.00),
    (2, 'COMPLETED', 2500.00),
    (3, 'PENDING', 1200.00),
    (5, 'COMPLETED', 4800.00);

INSERT INTO order_item (id_order, id_product, quantity, unit_price)
VALUES
    (1, 1, 2, 150.00),
    (1, 3, 1, 100.00),
    (2, 2, 5, 120.00),
    (2, 4, 3, 80.00),
    (3, 5, 4, 90.00),
    (3, 6, 2, 70.00),
    (4, 7, 10, 10.00),
    (4, 8, 5, 15.00);
    