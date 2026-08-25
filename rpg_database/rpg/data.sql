INSERT INTO class (name, description)
VALUES
    ('Warrior', 'Especialista em combate corpo a corpo'),
    ('Mage', 'Especialista em magia e ataques de longo alcance'),
    ('Archer', 'Especialista em ataques com arco e flecha'),
    ('Bard', 'Especialista em furtividade e ataques rápidos'),
    ('Priest', 'Especialista em cura e suporte');

INSERT INTO player (name, email)
VALUES
    ('Ariel', 'ariel@email.com'),
    ('Joao', 'joao@email.com'),
    ('Ana', 'ana@email.com'),
    ('Carlos', 'carlos@email.com'),
    ('Julia', 'julia@email.com');

INSERT INTO character (id_player, id_class, name, level)
VALUES   
    (1, 1, 'Arthas', 25),
    (1, 2, 'Merlin', 18),
    (2, 3, 'Legolas', 30),
    (2, 4, 'Ezio', 22),
    (3, 1, 'Brienne', 15),
    (3, 5, 'Jaina', 28),
    (4, 3, 'Robin', 12),
    (5, 4, 'Valeera', 35);

INSERT INTO item (name, type)
VALUES
    ('Sword of Valor', 'Weapon'),
    ('Staff of Wisdom', 'Weapon'),
    ('Bow of Precision', 'Weapon'),
    ('Dagger of Shadows', 'Weapon'),
    ('Shield of Fortitude', 'Armor'),
    ('Helmet of Insight', 'Armor'),
    ('Potion of Healing', 'Consumable'),
    ('Elixir of Strength', 'Consumable'),
    ('Ring of Agility', 'Accessory'),
    ('Amulet of Protection', 'Accessory');

INSERT INTO inventory (id_character, id_item, quantity)
VALUES
    (1, 1, 1),
    (1, 5, 1),

    (2, 2, 1),
    (2, 6, 1),

    (3, 3, 1),
    (3, 7, 5),

    (4, 4, 1),
    (4, 8, 3),

    (5, 9, 1),
    (5, 10, 1);

INSERT INTO mission (name, description, min_lvl, money_reward, exp_reward)
VALUES
    ('The Lost Artifact', 'Find the lost artifact in the ancient ruins', 10, 100, 50),
    ('Dragon Hunt', 'Defeat the dragon terrorizing the village', 25, 500, 200),
    ('Rescue the Princess', 'Rescue the princess from the castle', 15, 300, 100);

INSERT INTO character_mission (id_character, id_mission, status, start_date, completion_date)
VALUES
    (1, 1, 'COMPLETED', '2024-01-10', '2024-01-15'),
    (2, 2, 'PENDING', '2024-02-05', NULL),
    (3, 3, 'PENDING', '2024-03-12', NULL),
    (4, 1, 'COMPLETED', '2024-04-20', '2024-04-25'),
    (5, 2, 'PENDING', '2024-05-18', NULL);


