create table trainer(
		trainer_id int primary key,
		first_name varchar(80) not null,
		last_name varchar(80) not null
);

create table favorite_pokemon_types (
trainer_id integer,
type varchar(20),
foreign key (trainer_id) references trainer (trainer_id)
);

create table pokemon_teams (
team_id integer primary key autoincrement,
trainer_id integer,
pokemon_name varchar(80);
foreign key (trainer_id) references trainer (trainer_id)
);

INSERT INTO trainer (first_name, last_name)
VALUES 
('Sophie', 'Liu'),
('Ted', 'Neward'),
('Justin', 'Dong'),
('Meg', 'Balfrey');

-- Sophie Liu's favorite Pokemon types
INSERT INTO favorite_pokemon_types (trainer_id, type)
VALUES (1, 'Water'), (1, 'Electric');

-- Sophie Liu's Pokemon team
INSERT INTO pokemon_teams (trainer_id, pokemon_name)
VALUES (1, 'Pikachu'), (1, 'Blastoise'), (1, 'Charizard');

-- Sophie Liu's favorite Pokemon types
INSERT INTO favorite_pokemon_types (trainer_id, type)
VALUES (2, 'Grass'), (2, 'Bug');

-- Ted Neward's Pokemon team
INSERT INTO pokemon_teams (trainer_id, pokemon_name)
VALUES (2, 'Venusaur'), (2, 'Butterfree');

-- Justin Dong's favorite Pokemon types
INSERT INTO favorite_pokemon_types (trainer_id, type)
VALUES (3, 'Fire'), (3, 'Dragon');

-- Justin Dong's Pokemon team
INSERT INTO pokemon_teams (trainer_id, pokemon_name)
VALUES (3, 'Charizard'), (3, 'Dragonite'), (3, 'Magmar');

-- Meg Balfrey's favorite Pokemon types
INSERT INTO favorite_pokemon_types (trainer_id, type)
VALUES (4, 'Psychic'), (4, 'Fairy');

-- Meg Balfrey's Pokemon team
INSERT INTO pokemon_teams (trainer_id, pokemon_name)
VALUES (4, 'Mewtwo'), (4, 'Clefable'), (4, 'Jigglypuff');

