CREATE TABLE player (
    id_player SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    register_date DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT chk_player_name
        CHECK (LENGTH(TRIM(name)) >= 3),

    CONSTRAINT chk_player_email
        CHECK (POSITION('@' IN email) > 1)
);

CREATE TABLE class (
    id_class SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
)

CREATE TABLE character (
    id_character SERIAL PRIMARY KEY,

    id_player INT NOT NULL,
    id_class INT NOT NULL,

    name VARCHAR(50) NOT NULL,
    level INT NOT NULL DEFAULT 1,

    CONSTRAINT fk_character_player
        FOREIGN KEY (id_player)
        REFERENCES player(id_player)
        ON DELETE CASCADE,

    CONSTRAINT fk_character_class
        FOREIGN KEY (id_class)
        REFERENCES class(id_class)
        ON DELETE RESTRICT,

    CONSTRAINT chk_character_level
        CHECK (level >= 1),

    CONSTRAINT uq_character_name_per_player
        UNIQUE (id_player, name)
);

CREATE TABLE item (
    id_item SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,

    CONSTRAINT chk_item_type
        CHECK (type IN ('Weapon', 'Armor', 'Consumable', 'Accessory'))
);

CREATE TABLE inventory (
    id_character INT NOT NULL,
    id_item INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,

    CONSTRAINT pk_inventory
        PRIMARY KEY (id_character, id_item),

    CONSTRAINT fk_inventory_character
        FOREIGN KEY (id_character)
        REFERENCES character(id_character)
        ON DELETE CASCADE,

    CONSTRAINT fk_inventory_item
        FOREIGN KEY (id_item)
        REFERENCES item(id_item)
        ON DELETE RESTRICT,

    CONSTRAINT chk_inventory_quantity
        CHECK (quantity > 0)
);

CREATE TABLE mission (
    id_mission SERIAL PRIMARY KEY,

    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,

    min_lvl INT NOT NULL,
    money_reward INT NOT NULL DEFAULT 0,
    exp_reward INT NOT NULL DEFAULT 0,

    CONSTRAINT chk_mission_min_lvl
        CHECK (min_lvl >= 1),

    CONSTRAINT chk_mission_money_reward
        CHECK (money_reward >= 0),

    CONSTRAINT chk_mission_exp_reward
        CHECK (exp_reward >= 0)
);

CREATE TABLE character_mission (
    id_character INT NOT NULL,
    id_mission INT NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    completion_date DATE,

    CONSTRAINT pk_character_mission
        PRIMARY KEY (id_character, id_mission),

    CONSTRAINT fk_character_mission_character
        FOREIGN KEY (id_character)
        REFERENCES character(id_character)
        ON DELETE CASCADE,

    CONSTRAINT fk_character_mission_mission
        FOREIGN KEY (id_mission)
        REFERENCES mission(id_mission)
        ON DELETE RESTRICT,

    CONSTRAINT chk_character_mission_status
        CHECK (status IN ('PENDING', 'IN_PROGRESS', 'COMPLETED')),

    CONSTRAINT chk_completion_date
        CHECK (
            completion_date IS NULL
            OR completion_date >= start_date
        )
);