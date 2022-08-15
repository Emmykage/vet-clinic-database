/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);                                                                                                    INSERT 0 1            

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Gabumon', '2018-11-15', 2, 8, true); 
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Pikachu', '2021-01-7', 1, 15.04, false);   

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Devimon', '2017-05-12', 5, 11, true);   

-- query and update animals table
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Charmander', '2020-2-8', 0, -11, false);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Plantmon', '2021-11-15', 2, 5.7, true);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Squirtle', '1993-04-02', 3, 12.13, false);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('angemon', '2005-06-12', 1, 45, true);

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Boarmon','2005-06-12', 7, 20.4, true);       
 INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Blossom','1998-10-13', 3, 17, true);          
 INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Ditto','2022-05-14', 4, 22, true);  


--  insert into owners table
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);  
INSERT INTO species(name) VALUES ('Pokemon'),('Digimon'); 

-- modify inserted animals so it includes species_id
UPDATE animals SET species_id= (SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon%'; 
UPDATE animals SET species_id= (SELECT id FROM species WHERE name='Pokemon') WHERE name NOT LIKE '%mon%'; 

-- modify inserted animals to include owner information
-- Sam Smith owns Agumon
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' ) WHERE name='Agumon' RETURNING*;

-- Jennifer Orwell owns GAbumon
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name LIKE 'Gabumon' RETURNING *;
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name LIKE 'Pikachu' RETURNING *;

-- Bob own Devimon and Plantmon 
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name LIKE 'Devimon' RETURNING *;
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name LIKE 'Plantmon' RETURNING *;

-- Melody Pond own Charmander, Sqirtle and Blossom 
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name Like 'Charmander' RETURNING *;
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name Like 'Squirtle' RETURNING *;
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name Like 'Blossom' RETURNING *;

-- Dean Winchester owns Angemon and Boarmon.

UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name Like 'Angemon' RETURNING *;
UPDATE animals SET owner_id= (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name Like 'Boarmon' RETURNING *;

