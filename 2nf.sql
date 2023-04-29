--2nf

--create 2 tables to get rid of partial dependecies
--pokedex_number as the primary key, table 1 with pokedex_number and split_value, table 2 with pokedex_number and the rest of the columns


-- table 1: Create the pokemon_abilities table
CREATE TABLE pokemon_abilities (
  pokedex_number INT,
  split_value VARCHAR(255),
  PRIMARY KEY (pokedex_number)
);

CREATE TABLE split_abilities AS 
SELECT *, TRIM(value) AS split_value 
FROM importpokemon, JSON_EACH('["'|| REPLACE(abilities, ',', '","') || '"]') 
WHERE split_value <> '';

-- Insert data from split_abilities table into pokemon_abilities
INSERT INTO pokemon_abilities (pokedex_number, split_value)
SELECT pokedex_number, max(split_value)
FROM split_abilities
GROUP BY pokedex_number;

--table 2: create a table with all columns except split_values
CREATE TABLE importpokemon_normalized AS 
SELECT * FROM importpokemon;
ALTER TABLE importpokemon_normalized
DROP COLUMN abilities;


-- Query the pokemon_abilities table
SELECT * FROM pokemon_abilities;

