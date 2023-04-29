--3nf
--create four tables to eliminate transitive dependencies

-- Table 1: Create the types table
CREATE TABLE types (
pokedex_number INT,
type_1 VARCHAR(255),
type_2 VARCHAR(255),
PRIMARY KEY (pokedex_number)
);

-- Insert data from importpokemon_normalized table into types table
INSERT INTO types (pokedex_number, type_1, type_2)
SELECT pokedex_number, type_1, type_2
FROM importpokemon_normalized;

-- Table 2: Create the split_values table
CREATE TABLE split_values (
pokedex_number INT,
split_value VARCHAR(255),
PRIMARY KEY (pokedex_number)
);

-- Insert data from split_abilities table into split_values table
INSERT INTO split_values (pokedex_number, split_value)
SELECT pokedex_number, split_value
FROM split_abilities;

-- Table 3: Create the against_values table
CREATE TABLE against_values (
pokedex_number INT,
against_water FLOAT,
against_fire FLOAT,
against_ice FLOAT,
against_grass FLOAT,
against_electric FLOAT,
against_fighting FLOAT,
against_poison FLOAT,
against_ground FLOAT,
against_flying FLOAT,
against_psychic FLOAT,
against_bug FLOAT,
against_rock FLOAT,
against_ghost FLOAT,
against_dragon FLOAT,
against_dark FLOAT,
against_steel FLOAT,
against_fairy FLOAT,
PRIMARY KEY (pokedex_number)
);

-- Insert data from importpokemon_normalized table into against_values table
INSERT INTO against_values (pokedex_number, against_water, against_fire, against_ice, against_grass, against_electric, against_fighting, against_poison, against_ground, against_flying, against_psychic, against_bug, against_rock, against_ghost, against_dragon, against_dark, against_steel, against_fairy)
SELECT pokedex_number, against_water, against_fire, against_ice, against_grass, against_electric, against_fighting, against_poison, against_ground, against_flying, against_psychic, against_bug, against_rock, against_ghost, against_dragon, against_dark, against_steel, against_fairy
FROM importpokemon_normalized;

-- Table 4: Create the pokedex_numbers table
CREATE TABLE pokedex_numbers (
pokedex_number INT,
name VARCHAR(255),
type_1 VARCHAR(255),
type_2 VARCHAR(255),
hp INT,
attack INT,
defense INT,
sp_attack INT,
sp_defense INT,
speed INT,
PRIMARY KEY (pokedex_number)
);

-- Insert data from importpokemon_normalized table into pokedex_numbers table
INSERT INTO pokedex_numbers (pokedex_number, name, type_1, type_2, hp, attack, defense, sp_attack, sp_defense, speed)
SELECT pokedex_number, name, type_1, type_2, hp, attack, defense, sp_attack, sp_defense, speed
FROM importpokemon_normalized;



